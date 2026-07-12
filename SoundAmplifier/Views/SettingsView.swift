import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                Form {
                    // Audio Settings
                    Section(header: Text("Audio"), footer: Text("Adjust default audio processing settings")) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Default Amplification")
                                .font(.system(size: 14, weight: .semibold))
                            Slider(value: $viewModel.settings.defaultAmplification, in: 1...100)
                                .onChange(of: viewModel.settings.defaultAmplification) { newValue in
                                    viewModel.updateAmplification(newValue)
                                }
                            Text(String(format: "%.0fx", viewModel.settings.defaultAmplification))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Voice Boost Default")
                                .font(.system(size: 14, weight: .semibold))
                            Slider(value: $viewModel.settings.voiceBoostDefault, in: 0...100)
                                .onChange(of: viewModel.settings.voiceBoostDefault) { newValue in
                                    viewModel.updateVoiceBoost(newValue)
                                }
                        }
                    }
                    
                    // Equalizer Presets
                    Section(header: Text("Equalizer")) {
                        Picker("Preset", selection: $viewModel.selectedEQPreset) {
                            Text("Normal").tag("normal")
                            Text("Speech Clarity").tag("speech")
                            Text("TV Listening").tag("tv")
                            Text("Outdoor").tag("outdoor")
                            Text("Lecture").tag("lecture")
                            Text("Custom").tag("custom")
                        }
                        .onChange(of: viewModel.selectedEQPreset) { newValue in
                            viewModel.updateEQPreset(newValue)
                        }
                    }
                    
                    // Hearing Balance
                    Section(header: Text("Hearing Balance"), footer: Text("Adjust left/right ear balance")) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Left")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Center")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Right")
                                    .foregroundColor(.gray)
                            }
                            .font(.caption)
                            
                            Slider(value: $viewModel.leftRightBalance, in: -1...1)
                                .onChange(of: viewModel.leftRightBalance) { _ in
                                    viewModel.saveSettings()
                                }
                        }
                    }
                    
                    // App Settings
                    Section(header: Text("App")) {
                        Toggle("Dark Mode", isOn: $viewModel.settings.darkModeEnabled)
                            .onChange(of: viewModel.settings.darkModeEnabled) { _ in
                                viewModel.toggleDarkMode()
                            }
                        
                        Toggle("Haptic Feedback", isOn: $viewModel.settings.hapticFeedbackEnabled)
                            .onChange(of: viewModel.settings.hapticFeedbackEnabled) { _ in
                                viewModel.toggleHapticFeedback()
                            }
                        
                        Toggle("Auto Start Listening", isOn: $viewModel.settings.autoStartListening)
                            .onChange(of: viewModel.settings.autoStartListening) { _ in
                                viewModel.toggleAutoStart()
                            }
                        
                        Toggle("Sound Warnings", isOn: $viewModel.settings.soundWarningsEnabled)
                            .onChange(of: viewModel.settings.soundWarningsEnabled) { _ in
                                viewModel.toggleSoundWarnings()
                            }
                    }
                    
                    // Hearing Protection
                    Section(header: Text("Hearing Protection")) {
                        HStack {
                            Image(systemName: "shield.fill")
                                .foregroundColor(.green)
                            Text("Safe Listening Enabled")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }
                        
                        Text("Automatic volume protection prevents dangerous output levels.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    // About
                    Section(header: Text("About")) {
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("1.0.0")
                                .foregroundColor(.gray)
                        }
                        
                        NavigationLink(destination: PrivacyView()) {
                            Text("Privacy Information")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

struct PrivacyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Privacy Information")
                    .font(.system(size: 20, weight: .bold))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sound Amplifier collects:")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("• Audio from your microphone in real-time")
                    Text("• App usage patterns (stored locally)")
                    Text("• No personal identifying information")
                    Text("• No data is shared with third parties")
                    
                    Divider()
                    
                    Text("Data Storage:")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("All app settings are stored locally on your device. No data is sent to external servers.")
                }
                .font(.system(size: 13))
                .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(16)
        }
        .navigationTitle("Privacy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
