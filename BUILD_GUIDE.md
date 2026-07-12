# Build Instructions for Sound Amplifier

## Prerequisites

- **macOS**: 12.0 or later
- **Xcode**: 14.0 or later
- **iOS Target**: 15.0 or later
- **Apple Developer Account**: For device deployment

## Project Setup

### Step 1: Create Xcode Project

1. Open Xcode
2. File → New → Project
3. Select "App" template under iOS
4. Project name: `SoundAmplifier`
5. Organization Identifier: `com.soundamplifier` (or your identifier)
6. Language: Swift
7. Interface: SwiftUI
8. Storage: Git

### Step 2: Add Frameworks

In Xcode:
1. Select project → Targets → SoundAmplifier
2. Build Phases → Link Binary With Libraries
3. Add:
   - `AVFoundation.framework` (for audio)
   - `Accelerate.framework` (for DSP)
   - `UIKit.framework` (already included)

### Step 3: Copy Source Files

Copy all `.swift` files from `SoundAmplifier/` directory into Xcode project:

```
Views/
  - SoundAmplifierApp.swift
  - MainView.swift
  - WaveformView.swift
  - OnboardingView.swift
  - SettingsView.swift

ViewModels/
  - MainViewModel.swift
  - SettingsViewModel.swift

Models/
  - AppSettings.swift

AudioEngine/
  - AudioEngine.swift
  - AudioProcessor.swift

AudioProcessing/
  - VoiceBoostFilter.swift
  - NoiseReductionFilter.swift

Filters/
  - EqualizerFilter.swift
  - LimiterProtection.swift

Utilities/
  - ViewExtensions.swift
```

### Step 4: Configure Info.plist

Replace `Info.plist` content with the provided `SoundAmplifier/Info.plist`

Key permissions:
- `NSMicrophoneUsageDescription` - Microphone access
- `UIBackgroundModes` - Background audio
- `UIRequiredDeviceCapabilities` - Require microphone

### Step 5: Build Settings

1. Select project → Build Settings
2. Search for "iOS Deployment Target"
3. Set to `15.0` or later
4. Swift Language Version: `5.9`

## Building

### Debug Build (for testing on simulator/device)

```bash
xcodebuild -scheme SoundAmplifier -configuration Debug
```

Or in Xcode:
- Select device/simulator at top
- Press Play button (Cmd + R)

### Release Build (for App Store)

```bash
xcodebuild -scheme SoundAmplifier -configuration Release
```

Or in Xcode:
- Product → Archive
- Organizer → Validate App
- Upload to App Store Connect

## Testing

### Unit Tests

```bash
xcodebuild test -scheme SoundAmplifier -configuration Debug
```

### Manual Testing Checklist

- [ ] Launch app on physical device
- [ ] Complete onboarding (3 screens)
- [ ] Connect headphones
- [ ] Start listening - verify audio capture
- [ ] Adjust amplification slider (1-100x)
- [ ] Toggle Voice Boost - verify speech enhancement
- [ ] Test Noise Reduction modes
- [ ] Open Settings - verify all options save
- [ ] Test EQ presets
- [ ] Verify hearing balance control
- [ ] Check headphone disconnection warning
- [ ] Test background audio (minimize app while listening)
- [ ] Verify waveform animation

## Deployment

### To Physical Device

1. Connect iPhone via USB
2. Xcode → Product → Destination → Your Device
3. Xcode → Product → Run (Cmd + R)
4. Trust developer certificate on device

### To App Store

1. Apple Developer Account
2. Create App ID in Developer Portal
3. Create provisioning profile
4. Set Bundle Identifier in Xcode
5. Product → Archive
6. Upload to App Store Connect
7. Fill App metadata
8. Submit for review

## Troubleshooting

### "Microphone permission denied"
- Settings → Sound Amplifier → Microphone → Allow

### "No sound output"
- Verify headphones connected
- Check Settings → Sound Amplifier → Microphone enabled
- Restart app

### "High CPU usage"
- Reduce amplification level
- Disable noise reduction if not needed
- Close other audio apps

### "Build fails - framework not found"
- Verify frameworks added in Build Phases
- Clean Build Folder (Cmd + Shift + K)
- Rebuild

### "Simulator has no audio input"
- Use physical device for audio testing
- Simulator audio input is limited

## Performance Optimization

### For Release Build

1. Enable optimization:
   ```
   Build Settings → Swift Compiler (Optimization) → Optimize for Speed
   ```

2. Enable whole module optimization:
   ```
   Build Settings → Swift Compiler → Enable Whole Module Optimization
   ```

3. Strip debug symbols for release

### Audio Processing

Current implementation targets:
- **Latency**: < 50ms end-to-end
- **CPU**: ~15-20% on iPhone 12+
- **Memory**: ~50MB baseline
- **Battery**: Low impact in background

## File Structure

```
SoundAmplifier/
├── SoundAmplifier/
│   ├── SoundAmplifierApp.swift
│   ├── Views/
│   ├── ViewModels/
│   ├── Models/
│   ├── AudioEngine/
│   ├── AudioProcessing/
│   ├── Filters/
│   ├── Utilities/
│   └── Info.plist
├── SoundAmplifierTests/
│   └── SoundAmplifierTests.swift
├── README.md
└── BUILD_GUIDE.md (this file)
```

## Next Steps After Building

1. **Test on Device**: Real audio capture only works on physical device
2. **Monitor Performance**: Xcode Profiler for CPU/Memory
3. **Gather Feedback**: Test with users who need hearing assistance
4. **Iterate**: Add features based on feedback
5. **Publish**: Submit to App Store

## Additional Resources

- [Apple AVFoundation Documentation](https://developer.apple.com/documentation/avfoundation)
- [SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/)
- [Audio Unit Processing](https://developer.apple.com/documentation/audiounit)
- [Accelerate Framework](https://developer.apple.com/documentation/accelerate)

---

**Sound Amplifier - Professional Hearing Enhancement for iOS**
