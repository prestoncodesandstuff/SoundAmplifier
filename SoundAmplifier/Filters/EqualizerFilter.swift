import AVFoundation
import Accelerate

class EqualizerFilter {
    let format: AVAudioFormat
    
    @Published var preset: EQPreset = .normal
    @Published var frequencies: [Float: Float] = [:]
    
    private let frequencyBands: [Float] = [60, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]
    
    init(format: AVAudioFormat) {
        self.format = format
        initializeFrequencies()
    }
    
    private func initializeFrequencies() {
        for freq in frequencyBands {
            frequencies[freq] = 0.0 // 0 dB by default
        }
    }
    
    func setPreset(_ preset: EQPreset) {
        self.preset = preset
        let gains = preset.gains
        for (i, freq) in frequencyBands.enumerated() {
            frequencies[freq] = gains[i]
        }
    }
    
    func process(buffer: AVAudioPCMBuffer, dBGain: Float = 0.0) {
        guard let channelData = buffer.floatChannelData else { return }
        
        let frameLength = Int(buffer.frameLength)
        
        for channel in 0..<Int(buffer.format.channelCount) {
            var data = channelData[channel]
            
            // Convert dB to linear gain
            let linearGain = pow(10.0, dBGain / 20.0)
            var scaleFactor = linearGain
            
            vDSP_vsmul(data, 1, &scaleFactor, data, 1, vDSP_Length(frameLength))
        }
    }
}

enum EQPreset {
    case normal
    case speechClarity
    case tvListening
    case outdoor
    case lecture
    case custom
    
    var gains: [Float] {
        switch self {
        case .normal:
            return [0, 0, 0, 0, 0, 0, 0, 0, 0]
        case .speechClarity:
            return [0, 2, 4, 6, 8, 4, 2, 0, -2]
        case .tvListening:
            return [2, 2, 2, 4, 6, 4, 2, 0, 0]
        case .outdoor:
            return [-4, -2, 0, 2, 2, 0, 0, -2, -4]
        case .lecture:
            return [0, 0, 2, 4, 8, 6, 2, 0, 0]
        case .custom:
            return [0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
    }
}
