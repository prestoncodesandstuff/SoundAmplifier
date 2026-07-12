import AVFoundation
import Accelerate

class AudioEngine: NSObject, ObservableObject {
    @Published var isListening = false
    @Published var amplification: Float = 25.0
    @Published var voiceBoostEnabled = false
    @Published var voiceBoostStrength: Float = 50.0
    @Published var noiseReductionMode: NoiseReductionMode = .off
    @Published var dBLevel: Float = -80.0
    @Published var headphonesConnected = false
    
    private let audioSession = AVAudioSession.sharedInstance()
    private var audioEngine: AVAudioEngine!
    private var inputNode: AVAudioInputNode!
    private var outputNode: AVAudioOutputNode!
    private var mixerNode: AVAudioMixerNode!
    private var eqNode: AVAudioUnitEQ!
    
    private var audioProcessor: AudioProcessor?
    private var voiceBoostFilter: VoiceBoostFilter?
    private var noiseReductionFilter: NoiseReductionFilter?
    private var equalizerFilter: EqualizerFilter?
    private var limiterProtection: LimiterProtection?
    
    private var displayLink: CADisplayLink?
    
    override init() {
        super.init()
        setupAudioSession()
        setupAudioEngine()
        checkHeadphoneConnection()
        observeHeadphoneChanges()
    }
    
    private func setupAudioSession() {
        do {
            try audioSession.setCategory(.record, options: [.defaultToSpeaker, .duckOthers])
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Audio session error: \(error)")
        }
    }
    
    private func setupAudioEngine() {
        audioEngine = AVAudioEngine()
        inputNode = audioEngine.inputNode
        outputNode = audioEngine.outputNode
        
        let format = inputNode.outputFormat(forBus: 0)!
        
        // Initialize audio processors
        audioProcessor = AudioProcessor(format: format)
        voiceBoostFilter = VoiceBoostFilter(format: format)
        noiseReductionFilter = NoiseReductionFilter(format: format)
        equalizerFilter = EqualizerFilter(format: format)
        limiterProtection = LimiterProtection(format: format)
        
        // Connect nodes: input -> output (direct connection with tap for processing)
        audioEngine.attach(outputNode)
        audioEngine.connect(inputNode, to: outputNode, format: format)
        
        // Install tap for real-time processing
        inputNode.installTap(onBus: 0, bufferSize: 4096, format: format) { [weak self] buffer, time in
            self?.processAudio(buffer: buffer)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine start error: \(error)")
        }
    }
    
    private func processAudio(buffer: AVAudioPCMBuffer) {
        guard isListening else { return }
        
        // Apply noise reduction first
        if noiseReductionMode != .off {
            noiseReductionFilter?.process(buffer: buffer, strength: noiseReductionMode.strength)
        }
        
        // Apply voice boost
        if voiceBoostEnabled {
            voiceBoostFilter?.process(buffer: buffer, strength: voiceBoostStrength / 100.0)
        }
        
        // Apply equalizer
        equalizerFilter?.process(buffer: buffer)
        
        // Apply amplification
        audioProcessor?.amplify(buffer: buffer, gain: amplification)
        
        // Apply limiter protection
        limiterProtection?.process(buffer: buffer)
        
        // Calculate dB level
        updateDBLevel(buffer: buffer)
    }
    
    private func updateDBLevel(buffer: AVAudioPCMBuffer) {
        guard let data = buffer.floatChannelData else { return }
        
        let channelData = data[0]
        var rms: Float = 0
        var meanSquare: Float = 0
        
        vDSP_svesq(channelData, 1, &meanSquare, vDSP_Length(buffer.frameLength))
        rms = sqrt(meanSquare / Float(buffer.frameLength))
        
        let dB = 20 * log10(rms + 1e-5)
        DispatchQueue.main.async {
            self.dBLevel = max(-80, min(0, dB))
        }
    }
    
    func startListening() {
        guard !isListening else { return }
        
        do {
            try audioEngine.start()
            isListening = true
        } catch {
            print("Error starting audio engine: \(error)")
        }
    }
    
    func stopListening() {
        guard isListening else { return }
        
        audioEngine.stop()
        isListening = false
    }
    
    private func checkHeadphoneConnection() {
        let currentRoute = audioSession.currentRoute
        let hasHeadphones = currentRoute.outputs.contains { output in
            [.headphones, .bluetoothA2DP, .bluetoothHFP, .bluetoothLE].contains(output.portType)
        }
        DispatchQueue.main.async {
            self.headphonesConnected = hasHeadphones
        }
    }
    
    private func observeHeadphoneChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(audioRouteDidChange),
            name: AVAudioSession.routeChangeNotification,
            object: audioSession
        )
    }
    
    @objc private func audioRouteDidChange() {
        checkHeadphoneConnection()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        audioEngine.stop()
    }
}

enum NoiseReductionMode: String, CaseIterable {
    case off
    case low
    case medium
    case high
    
    var strength: Float {
        switch self {
        case .off: return 0.0
        case .low: return 0.3
        case .medium: return 0.6
        case .high: return 0.9
        }
    }
}
