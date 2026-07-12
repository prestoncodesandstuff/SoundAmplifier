import AVFoundation
import Accelerate

class LimiterProtection {
    let format: AVAudioFormat
    private let maxOutputLevel: Float = 1.0 // Prevent clipping
    private let threshold: Float = 0.95
    
    init(format: AVAudioFormat) {
        self.format = format
    }
    
    func process(buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData else { return }
        
        let frameLength = Int(buffer.frameLength)
        
        for channel in 0..<Int(buffer.format.channelCount) {
            let data = channelData[channel]
            
            for i in 0..<frameLength {
                let sample = abs(data[i])
                
                // Apply soft clipping if signal exceeds threshold
                if sample > threshold {
                    let ratio = threshold / sample
                    data[i] = data[i] * ratio
                }
                
                // Hard limit to prevent clipping
                data[i] = max(-maxOutputLevel, min(maxOutputLevel, data[i]))
            }
        }
    }
}
