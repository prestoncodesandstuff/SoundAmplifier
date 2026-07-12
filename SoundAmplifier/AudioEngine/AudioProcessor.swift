import AVFoundation
import Accelerate

class AudioProcessor {
    let format: AVAudioFormat
    
    init(format: AVAudioFormat) {
        self.format = format
    }
    
    func amplify(buffer: AVAudioPCMBuffer, gain: Float) {
        guard let channelData = buffer.floatChannelData else { return }
        
        let frameLength = Int(buffer.frameLength)
        let scaleFactor = gain // Direct gain multiplication
        
        for channel in 0..<Int(buffer.format.channelCount) {
            var scaledGain = scaleFactor
            vDSP_vsmul(channelData[channel], 1, &scaledGain, channelData[channel], 1, vDSP_Length(frameLength))
        }
    }
}
