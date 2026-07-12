import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var isListening = false
    @Published var amplification: Float = 25.0
    @Published var voiceBoostEnabled = false
    @Published var voiceBoostStrength: Float = 50.0
    @Published var noiseReductionMode: String = "off"
    @Published var dBLevel: Float = -80.0
    @Published var headphonesConnected = false
    @Published var showSettings = false
    @Published var audioStats = AudioStats()
    
    private var audioEngine: AudioEngine?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        audioEngine = AudioEngine()
        setupBindings()
    }
    
    private func setupBindings() {
        audioEngine?.$isListening
            .receive(on: DispatchQueue.main)
            .assign(to: &$isListening)
        
        audioEngine?.$amplification
            .receive(on: DispatchQueue.main)
            .assign(to: &$amplification)
        
        audioEngine?.$voiceBoostEnabled
            .receive(on: DispatchQueue.main)
            .assign(to: &$voiceBoostEnabled)
        
        audioEngine?.$voiceBoostStrength
            .receive(on: DispatchQueue.main)
            .assign(to: &$voiceBoostStrength)
        
        audioEngine?.$dBLevel
            .receive(on: DispatchQueue.main)
            .assign(to: &$dBLevel)
        
        audioEngine?.$headphonesConnected
            .receive(on: DispatchQueue.main)
            .assign(to: &$headphonesConnected)
    }
    
    func toggleListening() {
        if isListening {
            audioEngine?.stopListening()
        } else {
            audioEngine?.startListening()
        }
    }
    
    func updateAmplification(_ value: Float) {
        amplification = value
        audioEngine?.amplification = value
    }
    
    func toggleVoiceBoost() {
        voiceBoostEnabled.toggle()
        audioEngine?.voiceBoostEnabled = voiceBoostEnabled
    }
    
    func updateVoiceBoostStrength(_ value: Float) {
        voiceBoostStrength = value
        audioEngine?.voiceBoostStrength = value
    }
    
    func updateNoiseReduction(_ mode: String) {
        noiseReductionMode = mode
        if let noiseMode = NoiseReductionMode(rawValue: mode) {
            audioEngine?.noiseReductionMode = noiseMode
        }
    }
}
