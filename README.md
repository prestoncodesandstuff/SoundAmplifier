# Sound Amplifier - iOS

A free, professional hearing enhancement app for iOS that turns your iPhone into a personal listening device using real-time audio processing.

## Overview

Sound Amplifier is a completely free iOS app designed to help users hear surrounding sounds better. It uses your iPhone's microphone to capture audio, processes it in real-time to improve clarity, and plays the enhanced audio through headphones, AirPods, or Bluetooth earbuds.

**No premium plans, subscriptions, in-app purchases, ads, or locked features. Everything is available immediately.**

## Features

### Core Features
- ✅ Real-time audio amplification (1x to 100x)
- ✅ Voice Boost - enhance speech frequencies (500Hz-4000Hz)
- ✅ Noise Reduction with multiple modes (Off/Low/Medium/High)
- ✅ Professional 9-band Equalizer with presets
- ✅ Hearing Balance - left/right ear adjustment
- ✅ Live sound visualizer with waveform
- ✅ Automatic volume protection & limiter
- ✅ Safe listening mode with hearing protection

### User Experience
- ✅ Apple-style dark mode interface
- ✅ Automatic headphone detection
- ✅ Background audio processing
- ✅ Lock screen controls
- ✅ Haptic feedback support
- ✅ Completely offline - no account required
- ✅ Professional onboarding experience

### Preset Equalizers
- Normal (flat response)
- Speech Clarity (enhanced voice frequencies)
- TV Listening (balanced entertainment)
- Outdoor (wind noise reduction)
- Lecture (academic listening)
- Custom (user-defined)

## Technical Stack

- **Platform**: iOS 15.0+
- **Language**: Swift
- **Framework**: SwiftUI
- **Architecture**: MVVM
- **Audio Processing**:
  - AVFoundation
  - Audio Unit
  - Accelerate Framework (SIMD processing)
  - Real-time latency < 50ms

## Project Structure

```
SoundAmplifier/
├── SoundAmplifier/
│   ├── SoundAmplifierApp.swift          # App entry point
│   ├── Models/
│   │   └── AppSettings.swift            # User settings model
│   ├── Views/
│   │   ├── SoundAmplifierApp.swift      # SwiftUI main view
│   │   ├── MainView.swift               # Main listening interface
│   │   ├── WaveformView.swift           # Audio visualizer
│   │   ├── OnboardingView.swift         # First launch tutorial
│   │   └── SettingsView.swift           # User settings
│   ├── ViewModels/
│   │   ├── MainViewModel.swift          # Main screen logic
│   │   └── SettingsViewModel.swift      # Settings logic
│   ├── AudioEngine/
│   │   ├── AudioEngine.swift            # Core audio pipeline
│   │   └── AudioProcessor.swift         # Amplification
│   ├── AudioProcessing/
│   │   ├── VoiceBoostFilter.swift       # Voice enhancement
│   │   └── NoiseReductionFilter.swift   # Noise suppression
│   ├── Filters/
│   │   ├── EqualizerFilter.swift        # 9-band EQ
│   │   └── LimiterProtection.swift      # Safety limiter
│   ├── Utilities/
│   │   └── (utility helpers)
│   └── Info.plist                       # App configuration

```

## Getting Started

### Prerequisites
- Xcode 14.0 or later
- iOS 15.0 or later target
- Apple development account (for deployment)

### Installation & Running

1. **Clone or download the project**
   ```bash
   cd SoundAmplifier
   ```

2. **Open in Xcode**
   ```bash
   open SoundAmplifier.xcodeproj
   ```

3. **Select your target device/simulator**
   - Connect a physical iPhone or select a simulator
   - Note: Simulator audio input is limited; physical device recommended

4. **Build & Run**
   - Press `Cmd + R` or click the Play button in Xcode
   - App will launch and show onboarding

5. **Grant Permissions**
   - First launch: Allow microphone access
   - Connect headphones for best experience

### Usage

1. **Launch the App**
   - View onboarding (3 screens)
   - Press "Start Listening"

2. **Start Amplification**
   - Main screen shows large listening button
   - Connect headphones
   - Press the blue circle to start

3. **Adjust Settings**
   - **Amplification Slider**: 1x to 100x gain
   - **Voice Boost**: Toggle + strength control
   - **Noise Reduction**: Select mode (Off/Low/Medium/High)
   - **Settings Icon**: Access advanced settings

4. **Advanced Controls (Settings)**
   - Equalizer presets
   - Hearing balance (L/R)
   - Haptic feedback
   - Auto-start listening
   - Hearing protection

## Audio Processing Pipeline

```
Microphone Input
      ↓
Noise Reduction (if enabled)
      ↓
Voice Boost (if enabled)
      ↓
Equalizer (9-band)
      ↓
Amplifier (1-100x gain)
      ↓
Limiter (soft clipping + hard limit)
      ↓
Output to Headphones
```

### Latency
- Target: < 50ms end-to-end latency
- Achieved through efficient SIMD processing (Accelerate framework)
- Real-time priority audio thread

## Design Principles

1. **Accessibility First**: Simple, intuitive controls
2. **Apple Standards**: Native SwiftUI, dark mode
3. **Professional Quality**: Minimal distortion, clear audio
4. **Always Free**: Zero monetization, zero ads
5. **Privacy**: All processing offline, no data collection

## Permissions Required

- **Microphone**: To capture surrounding sounds
- **Audio Session**: To route audio to headphones
- **Background Audio**: To continue processing when minimized

## Supported Audio Hardware

- ✅ AirPods (all models)
- ✅ Bluetooth headphones
- ✅ Bluetooth earbuds
- ✅ Wired headphones
- ✅ Lightning headphones (iPhone with 3.5mm adapter)

## Safety & Hearing Protection

- **Volume Limiter**: Prevents dangerous output levels
- **Soft Clipping**: Reduces distortion
- **Threshold Detection**: Warns when approaching unsafe levels
- **Shield Icon**: Visual indicator of active protection

## Compliance & Standards

- **Accessibility**: WCAG 2.1 compliant
- **Audio**: Professional-grade latency and quality
- **Privacy**: No data collection or sharing
- **App Store**: Free, no IAP, no subscriptions

## Limitations

- Simulator audio input is limited (use physical device)
- Bluetooth latency varies by device
- Extreme amplification (>80x) may introduce distortion
- Noise reduction is noise-gating based (not ML-powered in free version)

## Future Enhancements

- [ ] Core ML-based noise reduction
- [ ] Real-time speech recognition
- [ ] Multiple microphone input mixing
- [ ] Audio recording and playback
- [ ] Accessibility shortcuts
- [ ] Language localization

## Troubleshooting

### No Sound Output
- Verify headphones are connected
- Check App → Microphone is enabled in Settings
- Restart the app

### High Latency
- Use physical device instead of simulator
- Reduce other background processes
- Check Bluetooth connection quality

### Distortion
- Reduce amplification level
- Lower voice boost strength
- Use higher noise reduction mode

### Microphone Not Working
- Grant microphone permission
- Restart app and iPhone
- Check System Settings → Sound & Haptics

## Contributing

This is a free, open learning project. Feel free to:
- Modify and improve the code
- Add new features
- Optimize audio processing
- Enhance the UI
- Report issues

## License

MIT License - Free to use, modify, and distribute

## Support

- **Built with**: Xcode, Swift, SwiftUI
- **Audio Framework**: AVFoundation
- **Performance**: Accelerate Framework
- **Documentation**: Full code comments included

## Getting Started for Developers

To extend this app:

1. **Add New Audio Filter**
   - Create new file in `Filters/`
   - Implement audio processing logic using SIMD
   - Integrate in `AudioEngine.swift`

2. **Add EQ Preset**
   - Edit `EqualizerFilter.swift`
   - Add new `EQPreset` case with frequency gains

3. **UI Customization**
   - Modify SwiftUI views in `Views/`
   - Update colors, fonts, layout
   - Use `MainView.swift` as reference

4. **Testing**
   - Use physical iPhone device
   - Test with various headphone types
   - Monitor CPU usage and battery impact

## App Submission

To publish on App Store:

1. Create Apple Developer account
2. Configure App ID and provisioning profiles in Xcode
3. Update bundle identifier in `Info.plist`
4. Build archive: Product → Archive
5. Upload to App Store Connect
6. Submit for review

---

**Sound Amplifier** - Turn your iPhone into a professional hearing enhancement device. Completely free. Always.
