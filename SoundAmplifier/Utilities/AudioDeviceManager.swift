import AVFoundation

class AudioDeviceManager {
    static let shared = AudioDeviceManager()
    
    func getConnectedHeadphones() -> [AVAudioSessionPortDescription] {
        let audioSession = AVAudioSession.sharedInstance()
        let currentRoute = audioSession.currentRoute
        
        return currentRoute.outputs.filter { output in
            [.headphones, .bluetoothA2DP, .bluetoothHFP, .bluetoothLE].contains(output.portType)
        }
    }
    
    func getHeadphoneType() -> String {
        let headphones = getConnectedHeadphones()
        guard let first = headphones.first else { return "None" }
        
        switch first.portType {
        case .headphones:
            return "Wired"
        case .bluetoothA2DP:
            return "Bluetooth (A2DP)"
        case .bluetoothHFP:
            return "Bluetooth (HFP)"
        case .bluetoothLE:
            return "Bluetooth LE"
        default:
            return "Unknown"
        }
    }
    
    func getMicrophoneInputs() -> [AVAudioSessionPortDescription] {
        let audioSession = AVAudioSession.sharedInstance()
        let currentRoute = audioSession.currentRoute
        return currentRoute.inputs
    }
    
    func recommendHeadphones() -> String {
        let audioSession = AVAudioSession.sharedInstance()
        let currentRoute = audioSession.currentRoute
        
        if currentRoute.outputs.isEmpty {
            return "No headphones detected. Connect AirPods, Bluetooth earbuds, or wired headphones for best experience."
        }
        return "Headphones connected. Ready to amplify audio."
    }
}
