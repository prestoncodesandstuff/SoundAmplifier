import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State private var showSettings = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Sound Amplifier")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "headphones")
                                .font(.caption)
                            Text(viewModel.headphonesConnected ? "Headphones Connected" : "Connect Headphones")
                                .font(.caption)
                        }
                        .foregroundColor(viewModel.headphonesConnected ? .green : .orange)
                    }
                    
                    Spacer()
                    
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gear")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(16)
                .background(Color(.systemGray6))
                
                Spacer()
                
                // Main Control Section
                VStack(spacing: 24) {
                    // Listening Button
                    VStack(spacing: 12) {
                        Button(action: { viewModel.toggleListening() }) {
                            ZStack {
                                Circle()
                                    .fill(viewModel.isListening ? Color.blue : Color.gray)
                                    .frame(width: 120, height: 120)
                                    .shadow(radius: viewModel.isListening ? 15 : 5)
                                
                                if viewModel.isListening {
                                    Circle()
                                        .stroke(Color.blue, lineWidth: 2)
                                        .frame(width: 135, height: 135)
                                        .opacity(0.5)
                                        .scaleEffect(1.1)
                                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: viewModel.isListening)
                                }
                                
                                VStack(spacing: 4) {
                                    Image(systemName: "mic.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                    Text(viewModel.isListening ? "Listening..." : "Start Listening")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                        Text(String(format: "dB Level: %.1f", viewModel.dBLevel))
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    
                    // Waveform Visualizer
                    WaveformView(dBLevel: viewModel.dBLevel)
                        .frame(height: 60)
                }
                .padding(.vertical, 40)
                
                Spacer()
                
                // Controls Section
                VStack(spacing: 20) {
                    // Amplification Control
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Amplification")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            Text(String(format: "%.0fx", viewModel.amplification))
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.blue)
                        }
                        
                        Slider(value: $viewModel.amplification, in: 1...100)
                            .onChange(of: viewModel.amplification) { newValue in
                                viewModel.updateAmplification(newValue)
                            }
                    }
                    
                    // Voice Boost
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Voice Boost")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            Toggle("", isOn: $viewModel.voiceBoostEnabled)
                                .onChange(of: viewModel.voiceBoostEnabled) { _ in
                                    viewModel.toggleVoiceBoost()
                                }
                        }
                        
                        if viewModel.voiceBoostEnabled {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(String(format: "Strength: %.0f%%", viewModel.voiceBoostStrength))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Slider(value: $viewModel.voiceBoostStrength, in: 0...100)
                                    .onChange(of: viewModel.voiceBoostStrength) { newValue in
                                        viewModel.updateVoiceBoostStrength(newValue)
                                    }
                            }
                        }
                    }
                    
                    // Noise Reduction
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Noise Reduction")
                            .font(.system(size: 14, weight: .semibold))
                        
                        HStack(spacing: 8) {
                            ForEach(["off", "low", "medium", "high"], id: \.self) { mode in
                                Button(action: { viewModel.updateNoiseReduction(mode) }) {
                                    Text(mode.capitalized)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(viewModel.noiseReductionMode == mode ? .white : .blue)
                                        .frame(maxWidth: .infinity)
                                        .padding(8)
                                        .background(viewModel.noiseReductionMode == mode ? Color.blue : Color.blue.opacity(0.1))
                                        .cornerRadius(6)
                                }
                            }
                        }
                    }
                }
                .padding(16)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(16)
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

#Preview {
    MainView()
}
