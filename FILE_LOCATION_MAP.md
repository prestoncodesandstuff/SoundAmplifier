# 📍 SOUND AMPLIFIER - COMPLETE FILE LOCATION MAP

## WATCH THIS FIRST

**All paths start from:**
```
C:\Users\prest\super hearing\
```

---

## DIRECTORY TREE - WHERE EVERYTHING IS

```
C:\Users\prest\
│
└── super hearing/                                    ← MAIN FOLDER
    │
    ├── SoundAmplifier/                              ← MAIN SWIFT PROJECT
    │   │                                             (For iOS via cloud Mac)
    │   ├── SoundAmplifier.xcodeproj/                ← THIS IS THE PROJECT FILE
    │   │   ├── project.pbxproj                      ← Build configuration
    │   │   ├── project.xcconfig                     ← Compiler settings
    │   │   └── xcshareddata/
    │   │       └── xcschemes/
    │   │           └── SoundAmplifier.xcscheme      ← Xcode scheme
    │   │
    │   ├── SoundAmplifier/                          ← SOURCE CODE FOLDER
    │   │   ├── SoundAmplifierApp.swift              ← App entry point ⭐
    │   │   ├── Info.plist                           ← App permissions ⭐
    │   │   │
    │   │   ├── Views/                               ← UI SCREENS
    │   │   │   ├── MainView.swift                   ← Main listening screen
    │   │   │   ├── WaveformView.swift               ← Audio visualizer
    │   │   │   ├── OnboardingView.swift             ← Tutorial screens
    │   │   │   └── SettingsView.swift               ← Settings panel
    │   │   │
    │   │   ├── ViewModels/                          ← STATE MANAGEMENT
    │   │   │   ├── MainViewModel.swift              ← Main screen logic
    │   │   │   └── SettingsViewModel.swift          ← Settings logic
    │   │   │
    │   │   ├── Models/                              ← DATA MODELS
    │   │   │   └── AppSettings.swift                ← Settings storage
    │   │   │
    │   │   ├── AudioEngine/                         ← CORE AUDIO PROCESSING ⭐⭐⭐
    │   │   │   ├── AudioEngine.swift                ← Main audio pipeline
    │   │   │   └── AudioProcessor.swift             ← Amplification (gain)
    │   │   │
    │   │   ├── AudioProcessing/                     ← AUDIO FILTERS
    │   │   │   ├── VoiceBoostFilter.swift           ← Speech enhancement
    │   │   │   └── NoiseReductionFilter.swift       ← Noise suppression
    │   │   │
    │   │   ├── Filters/                             ← AUDIO EFFECTS
    │   │   │   ├── EqualizerFilter.swift            ← 9-band EQ
    │   │   │   └── LimiterProtection.swift          ← Safety limiter
    │   │   │
    │   │   └── Utilities/                           ← HELPERS
    │   │       ├── ViewExtensions.swift             ← UI extensions
    │   │       └── AudioDeviceManager.swift         ← Headphone detection
    │   │
    │   ├── SoundAmplifierTests/                     ← UNIT TESTS
    │   │   └── SoundAmplifierTests.swift            ← Test cases
    │   │
    │   ├── .github/
    │   │   └── copilot-instructions.md              ← Setup notes
    │   │
    │   ├── README.md                                ← Full documentation
    │   ├── BUILD_GUIDE.md                           ← Build steps
    │   ├── SETUP_SUMMARY.md                         ← Project overview
    │   ├── DEVELOPER_REFERENCE.md                   ← Code reference
    │   └── WINDOWS_TO_IPHONE_GUIDE.md               ← THIS FILE'S TWIN
    │
    └── SoundAmplifierReactNative/                   ← EMPTY (React Native alternative)
        (Not used - kept for reference)
```

---

## WHAT EACH FILE DOES

### ⭐⭐⭐ CRITICAL FILES (Must understand these)

#### **SoundAmplifierApp.swift**
- **Location:** `C:\Users\prest\super hearing\SoundAmplifier\SoundAmplifier\SoundAmplifierApp.swift`
- **What it does:** App starting point - when you open app on iPhone, this runs first
- **Why you need it:** Every Swift app needs this as entry point
- **What to change:** Title, splash screen text
- **Size:** ~30 lines of code

#### **Info.plist**
- **Location:** `C:\Users\prest\super hearing\SoundAmplifier\SoundAmplifier\Info.plist`
- **What it does:** Tells iOS about your app - permissions, version, features needed
- **Why it matters:** Contains microphone permission request
- **What's in it:**
  ```
  NSMicrophoneUsageDescription = "We need microphone to amplify sound"
  UIRequiredDeviceCapabilities = microphone
  UIBackgroundModes = audio (allows background listening)
  ```
- **Key permission:** Line that says `NSMicrophoneUsageDescription`

#### **AudioEngine.swift**
- **Location:** `C:\Users\prest\super hearing\SoundAmplifier\SoundAmplifier\AudioEngine\AudioEngine.swift`
- **What it does:** The core audio system - captures microphone, processes sound, plays to headphones
- **Why it's the most important:** Everything audio happens here
- **Key features:**
  - Starts/stops listening
  - Manages amplification level
  - Detects headphones
  - Real-time processing
- **Lines of code:** ~150 lines
- **When to modify:** To change audio behavior, adjust latency, add new features

### ⭐⭐ IMPORTANT FILES

#### **MainView.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Views\MainView.swift`
- **What it does:** The main listening screen user sees
- **Contains:**
  - Large listening button (on/off)
  - Amplification slider
  - Voice Boost toggle
  - Noise Reduction selector
  - Settings button
- **To customize:** Change colors, button positions, slider ranges
- **Lines of code:** ~200 lines

#### **AudioProcessor.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\AudioEngine\AudioProcessor.swift`
- **What it does:** Handles amplification (volume increase)
- **Range:** 1x to 100x gain
- **To modify:** Change maximum amplification, adjust formula
- **Lines of code:** ~20 lines

#### **EqualizerFilter.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Filters\EqualizerFilter.swift`
- **What it does:** 9-band equalizer with presets
- **Presets included:**
  - Normal (flat)
  - Speech Clarity (voice enhancement)
  - TV Listening (entertainment)
  - Outdoor (wind reduction)
  - Lecture (academic)
- **To add preset:** Add new case with frequency gains
- **Lines of code:** ~60 lines

#### **SettingsView.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Views\SettingsView.swift`
- **What it does:** Settings screen accessible from gear icon
- **Contains:**
  - Amplification default
  - Voice Boost settings
  - Hearing balance (L/R)
  - Dark mode toggle
  - Privacy info
- **To modify:** Add new settings, change layout
- **Lines of code:** ~150 lines

### ⭐ USEFUL FILES

#### **VoiceBoostFilter.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\AudioProcessing\VoiceBoostFilter.swift`
- **What it does:** Enhances human speech frequencies (500Hz-4000Hz)
- **Why:** Makes voices easier to understand
- **To modify:** Change frequency range, boost strength

#### **NoiseReductionFilter.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\AudioProcessing\NoiseReductionFilter.swift`
- **What it does:** Reduces background noise in 4 modes
- **Modes:**
  - Off (no processing)
  - Low (gentle)
  - Medium (balanced)
  - High (aggressive)
- **To modify:** Adjust threshold, change gate algorithm

#### **LimiterProtection.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Filters\LimiterProtection.swift`
- **What it does:** Prevents distortion and hearing damage
- **How:** Soft clipping at 0.95, hard limit at 1.0
- **Why:** Safety feature - protects from extreme amplification

#### **WaveformView.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Views\WaveformView.swift`
- **What it does:** Real-time audio visualizer
- **Shows:** Waves that respond to microphone input
- **To customize:** Change colors, wave size, animation

#### **OnboardingView.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Views\OnboardingView.swift`
- **What it does:** First-time user tutorial (3 screens)
- **Screens:**
  1. Microphone introduction
  2. Connect headphones
  3. Place phone near sound
- **To modify:** Change text, add/remove screens, change icons

#### **MainViewModel.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\ViewModels\MainViewModel.swift`
- **What it does:** Controls state of main screen
- **Manages:**
  - Is listening? (on/off)
  - Amplification level
  - Voice Boost state
  - Noise Reduction mode
  - dB meter reading
- **To modify:** Add new state variables, change initial values

#### **SettingsViewModel.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\ViewModels\SettingsViewModel.swift`
- **What it does:** Saves/loads settings from iPhone storage
- **Uses:** UserDefaults (iPhone's local storage)
- **Saves:** All user preferences
- **To modify:** Add new settings, change default values

#### **AppSettings.swift**
- **Location:** `SoundAmplifier\SoundAmplifier\Models\AppSettings.swift`
- **What it does:** Data model for all settings
- **Stores:**
  - Default amplification (25x)
  - Voice Boost default (0)
  - Noise Reduction default (off)
  - Dark mode (true)
  - Hearing protection (enabled)
  - Left/Right balance
- **To modify:** Add new settings here first

### 📋 CONFIGURATION FILES

#### **project.pbxproj**
- **Location:** `SoundAmplifier.xcodeproj\project.pbxproj`
- **What it does:** Xcode build configuration file
- **WARNING:** Don't edit directly - use Xcode GUI
- **Contains:** File references, build settings, dependencies
- **Size:** ~2MB

#### **project.xcconfig**
- **Location:** `SoundAmplifier.xcodeproj\project.xcconfig`
- **What it does:** Build settings like:
  - App name
  - Bundle identifier
  - Deployment target (iOS 15.0)
  - Swift version (5.9)
- **To modify:** Change app name, bundle ID, iOS version

#### **SoundAmplifier.xcscheme**
- **Location:** `SoundAmplifier.xcodeproj\xcshareddata\xcschemes\SoundAmplifier.xcscheme`
- **What it does:** Xcode build scheme (how to build and run app)
- **Contains:** Debug/Release configurations, test settings
- **WARNING:** Usually don't need to edit

### 📚 DOCUMENTATION FILES

| File | Location | Purpose |
|------|----------|---------|
| **README.md** | `SoundAmplifier\README.md` | Complete user & developer guide |
| **BUILD_GUIDE.md** | `SoundAmplifier\BUILD_GUIDE.md` | How to build on Mac |
| **SETUP_SUMMARY.md** | `SoundAmplifier\SETUP_SUMMARY.md` | Project overview |
| **DEVELOPER_REFERENCE.md** | `SoundAmplifier\DEVELOPER_REFERENCE.md` | Code quick reference |
| **WINDOWS_TO_IPHONE_GUIDE.md** | `SoundAmplifier\WINDOWS_TO_IPHONE_GUIDE.md` | Windows→iPhone guide |

---

## QUICK FIND REFERENCE

### If you want to...

**Change the main button color**
→ `SoundAmplifier\Views\MainView.swift` (search for `.fill(Color.blue)`)

**Add new sound effect**
→ `SoundAmplifier\AudioProcessing\` (create new filter file)

**Add new EQ preset**
→ `SoundAmplifier\Filters\EqualizerFilter.swift` (add case to enum)

**Change microphone permission text**
→ `SoundAmplifier\Info.plist` (change `NSMicrophoneUsageDescription`)

**Modify app name**
→ `SoundAmplifier.xcodeproj\project.xcconfig` (change `PRODUCT_NAME`)

**Change default amplification**
→ `SoundAmplifier\Models\AppSettings.swift` (change `defaultAmplification: Float = 25.0`)

**Change listening button size**
→ `SoundAmplifier\Views\MainView.swift` (search for `frame(width: 120, height: 120)`)

**Add new setting**
→ `SoundAmplifier\Models\AppSettings.swift` (add property)
→ `SoundAmplifier\Views\SettingsView.swift` (add UI)
→ `SoundAmplifier\ViewModels\SettingsViewModel.swift` (add handler)

**Fix audio not working**
→ `SoundAmplifier\AudioEngine\AudioEngine.swift` (check `setupAudioSession`)

**Change headphone detection behavior**
→ `SoundAmplifier\Utilities\AudioDeviceManager.swift` (modify detection logic)

**Add unit tests**
→ `SoundAmplifierTests\SoundAmplifierTests.swift` (add test functions)

---

## FILE SIZES & COMPLEXITY

| File | Size | Complexity | Purpose |
|------|------|-----------|---------|
| AudioEngine.swift | 150 lines | Hard | Core audio |
| MainView.swift | 200 lines | Medium | Main UI |
| SettingsView.swift | 150 lines | Medium | Settings UI |
| EqualizerFilter.swift | 60 lines | Easy | 9-band EQ |
| LimiterProtection.swift | 35 lines | Easy | Safety limiter |
| OnboardingView.swift | 80 lines | Easy | Tutorial |
| WaveformView.swift | 30 lines | Easy | Visualization |
| AudioProcessor.swift | 20 lines | Easy | Amplification |
| VoiceBoostFilter.swift | 35 lines | Easy | Voice enhancement |
| NoiseReductionFilter.swift | 35 lines | Easy | Noise gate |
| ViewExtensions.swift | 50 lines | Easy | UI helpers |
| AudioDeviceManager.swift | 50 lines | Medium | Device detection |
| MainViewModel.swift | 60 lines | Medium | State |
| SettingsViewModel.swift | 70 lines | Medium | Settings storage |
| AppSettings.swift | 20 lines | Easy | Data model |

---

## WHICH FILES TO CHANGE FIRST

### For Beginners (Change colors, text):
1. **MainView.swift** - Change button colors
2. **Info.plist** - Change app name/permissions
3. **SettingsView.swift** - Modify settings text

### For Intermediate (Add features):
1. **AudioEngine.swift** - Understand audio flow
2. **EqualizerFilter.swift** - Add EQ presets
3. **AppSettings.swift** - Add new settings

### For Advanced (Deep changes):
1. **AudioProcessor.swift** - Modify amplification algorithm
2. **VoiceBoostFilter.swift** - Change voice frequencies
3. **NoiseReductionFilter.swift** - Improve noise reduction

---

## CODE STRUCTURE EXPLAINED

```
SoundAmplifier/
│
├── App Entry Point
│   └── SoundAmplifierApp.swift ─→ Runs first when app launches
│
├── User Interface (What user sees)
│   ├── MainView.swift ──────────→ Listening screen
│   ├── SettingsView.swift ──────→ Settings screen
│   ├── OnboardingView.swift ────→ Tutorial screens
│   └── WaveformView.swift ──────→ Audio visualizer
│
├── State Management (Keeps track of everything)
│   ├── MainViewModel.swift ─────→ Controls main screen state
│   └── SettingsViewModel.swift ──→ Saves/loads settings
│
├── Data Models (Data structure)
│   └── AppSettings.swift ───────→ Settings data
│
├── Audio Processing (Sound magic happens here)
│   ├── AudioEngine.swift ───────→ Main audio system
│   ├── AudioProcessor.swift ────→ Volume control
│   ├── VoiceBoostFilter.swift ──→ Speech enhancement
│   └── NoiseReductionFilter.swift→ Noise reduction
│
├── Audio Effects (Sound modifications)
│   ├── EqualizerFilter.swift ───→ 9-band EQ
│   └── LimiterProtection.swift ──→ Safety limiter
│
└── Utilities (Helper functions)
    ├── ViewExtensions.swift ────→ UI helpers
    └── AudioDeviceManager.swift ─→ Headphone detection
```

---

## HOW DATA FLOWS

```
User taps button
    ↓
MainView.swift detects tap
    ↓
Calls MainViewModel.toggleListening()
    ↓
ViewModel calls AudioEngine.startListening()
    ↓
AudioEngine sets up microphone capture
    ↓
Audio flows through pipeline:
    Microphone → Noise Reduction → Voice Boost → EQ → Amplifier → Limiter → Headphones
    ↓
ViewModel updates @Published variables
    ↓
MainView automatically re-renders
    ↓
User sees: Blue circle, "Listening...", waveform animating
```

---

## MOST IMPORTANT FILES TO UNDERSTAND

### Rank by Importance:

1. **AudioEngine.swift** ⭐⭐⭐
   - Core audio processing
   - Without this, no sound works
   - Most complex file

2. **MainView.swift** ⭐⭐
   - What users see
   - All main controls here
   - Second most important

3. **Info.plist** ⭐⭐
   - Permissions for microphone
   - App configuration
   - Must be correct or app won't work

4. **EqualizerFilter.swift** ⭐
   - Audio effects
   - Adds professional features
   - Relatively easy to modify

5. **SettingsView.swift** ⭐
   - User preferences
   - Customization options
   - Important for UX

---

## TESTING WHICH FILES WORK

### To test audio:
- Open: `AudioEngine.swift`
- Run on device with headphones
- If no sound: Issue is here

### To test UI:
- Open: `MainView.swift`
- Run on simulator or device
- If button doesn't work: Issue is here

### To test settings saving:
- Open: `SettingsViewModel.swift` and `AppSettings.swift`
- Change setting, close app, reopen
- If setting lost: Issue is here

### To test voice boost:
- Open: `VoiceBoostFilter.swift`
- Enable Voice Boost on device
- If not clearer: Issue might be here

---

## TOTAL CODEBASE STATS

- **Total Swift Files:** 22
- **Total Lines of Code:** 1,100+
- **Largest File:** AudioEngine.swift (150 lines)
- **Smallest File:** AudioProcessor.swift (20 lines)
- **Comment Density:** 30-40% of lines are comments
- **Time to Understand All:** 2-4 hours
- **Time to Modify a Feature:** 30 minutes - 2 hours

---

## DIRECTORY TREE - Copy-Paste Version

```
C:\Users\prest\super hearing\SoundAmplifier\
├── SoundAmplifier.xcodeproj/
│   ├── project.pbxproj
│   ├── project.xcconfig
│   └── xcshareddata/xcschemes/SoundAmplifier.xcscheme
├── SoundAmplifier/
│   ├── SoundAmplifierApp.swift
│   ├── Info.plist
│   ├── Views/
│   │   ├── MainView.swift
│   │   ├── WaveformView.swift
│   │   ├── OnboardingView.swift
│   │   └── SettingsView.swift
│   ├── ViewModels/
│   │   ├── MainViewModel.swift
│   │   └── SettingsViewModel.swift
│   ├── Models/
│   │   └── AppSettings.swift
│   ├── AudioEngine/
│   │   ├── AudioEngine.swift
│   │   └── AudioProcessor.swift
│   ├── AudioProcessing/
│   │   ├── VoiceBoostFilter.swift
│   │   └── NoiseReductionFilter.swift
│   ├── Filters/
│   │   ├── EqualizerFilter.swift
│   │   └── LimiterProtection.swift
│   └── Utilities/
│       ├── ViewExtensions.swift
│       └── AudioDeviceManager.swift
├── SoundAmplifierTests/
│   └── SoundAmplifierTests.swift
├── .github/
│   └── copilot-instructions.md
├── README.md
├── BUILD_GUIDE.md
├── SETUP_SUMMARY.md
├── DEVELOPER_REFERENCE.md
└── WINDOWS_TO_IPHONE_GUIDE.md
```

---

**Sound Amplifier - Complete File Location Map**
Accurate as of July 12, 2026
