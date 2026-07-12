import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var settings: AppSettings
    @Published var selectedEQPreset: String = "normal"
    @Published var leftRightBalance: Float = 0.0
    
    private let userDefaults = UserDefaults.standard
    private let settingsKey = "appSettings"
    
    init() {
        if let savedData = userDefaults.data(forKey: settingsKey),
           let decoded = try? JSONDecoder().decode(AppSettings.self, from: savedData) {
            self.settings = decoded
        } else {
            self.settings = AppSettings()
        }
        self.leftRightBalance = settings.leftRightBalance
    }
    
    func saveSettings() {
        settings.leftRightBalance = leftRightBalance
        if let encoded = try? JSONEncoder().encode(settings) {
            userDefaults.set(encoded, forKey: settingsKey)
        }
    }
    
    func updateAmplification(_ value: Float) {
        settings.defaultAmplification = value
        saveSettings()
    }
    
    func updateVoiceBoost(_ value: Float) {
        settings.voiceBoostDefault = value
        saveSettings()
    }
    
    func updateNoiseReduction(_ value: String) {
        settings.noiseReductionDefault = value
        saveSettings()
    }
    
    func toggleDarkMode() {
        settings.darkModeEnabled.toggle()
        saveSettings()
    }
    
    func toggleHapticFeedback() {
        settings.hapticFeedbackEnabled.toggle()
        saveSettings()
    }
    
    func toggleAutoStart() {
        settings.autoStartListening.toggle()
        saveSettings()
    }
    
    func toggleSoundWarnings() {
        settings.soundWarningsEnabled.toggle()
        saveSettings()
    }
    
    func updateEQPreset(_ preset: String) {
        selectedEQPreset = preset
        saveSettings()
    }
}
