import Foundation

struct AppSettings: Codable {
    var defaultAmplification: Float = 25.0
    var voiceBoostDefault: Float = 0.0
    var noiseReductionDefault: String = "off"
    var darkModeEnabled: Bool = true
    var hapticFeedbackEnabled: Bool = true
    var autoStartListening: Bool = false
    var soundWarningsEnabled: Bool = true
    var leftRightBalance: Float = 0.0 // -1.0 (left) to 1.0 (right)
    var safeListeningEnabled: Bool = true
}

struct AudioStats {
    var currentdBLevel: Float = -80.0
    var peakdBLevel: Float = -80.0
    var averagedBLevel: Float = -80.0
}
