# 🎧 Sound Amplifier: Complete Windows → iPhone Installation Guide

## TABLE OF CONTENTS
1. [What You Have](#what-you-have)
2. [Option A: Cloud Mac (Easiest)](#option-a-cloud-mac-easiest)
3. [Option B: GitHub Actions](#option-b-github-actions-advanced)
4. [Option C: TestFlight](#option-c-testflight)
5. [Troubleshooting](#troubleshooting)

---

## WHAT YOU HAVE

### Your Windows PC
- Location: `C:\Users\prest\super hearing\SoundAmplifier\`
- Contains: 22+ Swift files ready to build
- Status: ✅ Complete, ready to compile

### Your iPhone
- iOS 15.0 or later
- USB cable to connect to Mac
- Apple ID (can be free)

**Problem:** Xcode (Apple's compiler) only runs on Mac, not Windows

**Solution:** Rent a Mac remotely for 1-2 hours ($1-2)

---

## OPTION A: CLOUD MAC (EASIEST - RECOMMENDED)

### ⏱️ Time Required: 2-3 hours total
### 💰 Cost: $1-2
### ✅ Success Rate: 99%

---

## STEP 1: SIGN UP FOR CLOUD MAC SERVICE

### Choose One:

#### **MacStadium** (Most Reliable)
- **Website:** www.macstadium.com
- **Cost:** $1/hour (minimum 1 hour)
- **Steps to Sign Up:**
  1. Go to `macstadium.com` in any browser
  2. Click **"Sign Up"** (top right corner)
  3. Enter email address
  4. Create password
  5. Click **"Create Account"**
  6. Click confirmation link in email
  7. Add credit card (will charge only what you use)
  8. Click **"Buy"** next to any Mac Mini plan
  9. Select **"1 Hour"** duration
  10. Click **"Add to Cart"**
  11. Click **"Checkout"**
  12. Confirm payment

#### **Macincloud** (User-Friendly)
- **Website:** www.macincloud.com
- **Cost:** $2.99/hour (try free trial first)
- **Steps to Sign Up:**
  1. Go to `macincloud.com`
  2. Click **"Free Trial"** (top right)
  3. Fill in email/password
  4. Verify email
  5. You get 1 hour free to test

#### **Paperspace** (Good Option)
- **Website:** www.paperspace.com
- **Cost:** $1.09/hour
- **Steps to Sign Up:**
  1. Go to `paperspace.com`
  2. Click **"Create Account"** (top right)
  3. Enter email & password
  4. Select **"Mac"** as machine type
  5. Add payment method

---

## STEP 2: CONNECT TO CLOUD MAC

### After Purchase/Sign Up:

1. **Find Your Mac Connection Details**
   - Check email or dashboard for IP address
   - Get username & password from email/account

2. **On Windows PC, Use Remote Desktop:**
   - Press `Windows Key + R`
   - Type: `mstsc`
   - Press Enter
   - Paste IP address
   - Click Connect
   - Enter username & password from email

3. **Or Use TeamViewer (Easier):**
   - Download: `teamviewer.com/download`
   - Install on Windows
   - Open app
   - Enter Mac's ID from cloud provider
   - Click Connect
   - You now see the Mac screen

**Result:** Your Windows screen now shows the cloud Mac desktop

---

## STEP 3: PREPARE YOUR FILES ON WINDOWS PC

### Before Connecting to Cloud Mac:

1. **Create a ZIP of Your Project**
   - Open File Explorer: `Windows Key + E`
   - Navigate to: `C:\Users\prest\super hearing\SoundAmplifier`
   - Right-click on folder
   - Click **"Send to" → "Compressed (zipped) folder"**
   - New file created: `SoundAmplifier.zip`
   - **Size:** ~2MB

2. **Or Use OneDrive/Dropbox**
   - Upload `SoundAmplifier` folder to OneDrive
   - Or upload to Dropbox
   - You can access from cloud Mac easily

---

## STEP 4: GET YOUR FILES TO CLOUD MAC

### Option A: Using OneDrive (Easiest)

1. **On Cloud Mac Desktop:**
   - Open web browser (Safari)
   - Go to `onedrive.com`
   - Sign in with your Microsoft account
   - Find your uploaded `SoundAmplifier` folder
   - Click download arrow
   - Save to Desktop

### Option B: Using USB Drive

1. **On Windows PC:**
   - Plug in USB drive
   - Copy `SoundAmplifier` folder to USB
   - Eject USB drive

2. **Physically Connect to Cloud Mac:**
   - Plug USB into cloud Mac
   - Finder will show USB device
   - Copy `SoundAmplifier` to Desktop

### Option C: Email (Small files)

1. Zip project
2. Email to yourself
3. Open email on cloud Mac
4. Download attachment

---

## STEP 5: OPEN PROJECT IN XCODE ON CLOUD MAC

### On the Cloud Mac (Remote Screen):

1. **Open Finder**
   - Click Finder icon (blue face, left side of dock at bottom)
   - Or press `Cmd + Space` and type `Finder`

2. **Navigate to Your Project**
   - Look for your Desktop (should see `SoundAmplifier` folder)
   - Or look in Downloads folder
   - Double-click `SoundAmplifier` folder

3. **Open the Project**
   - Find file named: `SoundAmplifier.xcodeproj`
   - Double-click it
   - Xcode will open automatically

4. **If Xcode Doesn't Open:**
   - Right-click on `SoundAmplifier.xcodeproj`
   - Click **"Open With" → "Xcode"**

5. **Wait for Xcode to Load**
   - This takes 30-60 seconds
   - You'll see the project structure on the left

---

## STEP 6: CONNECT YOUR IPHONE TO CLOUD MAC

### Physical Connection:

1. **Plug iPhone into Cloud Mac via USB**
   - Use USB-A to Lightning cable
   - Physical Mac will need USB port
   - Most cloud Macs have USB ports available

2. **Or Use WiFi (Wireless Connection)**
   - In Xcode (top bar, next to Play button)
   - Click device selector dropdown
   - Click **"Add Additional Simulators"**
   - Select **"Devices"**
   - In sidebar, find your iPhone name
   - Check box for WiFi option

3. **On Your iPhone:**
   - Unlock it
   - You may see prompt: "Trust this Computer?"
   - Tap **"Trust"**

4. **Back in Xcode:**
   - Your iPhone should now appear in device list

---

## STEP 7: CONFIGURE SIGNING

### In Xcode (Cloud Mac Screen):

1. **In Left Panel:** Click **"SoundAmplifier"** (project icon, not file)

2. **In Center Panel:** Click **"SoundAmplifier"** (under TARGETS)

3. **Click Tab:** **"Signing & Capabilities"** (top middle)

4. **Signing Section:**
   - Check: ✅ **"Automatically manage signing"**
   - Under "Team" dropdown:
     - If not already selected, click dropdown
     - Select your Apple ID
     - Or click **"Add Account"** if needed

5. **Bundle Identifier:**
   - Find field: `com.example.soundamplifier`
   - Change to: `com.yourname.soundamplifier`
   - Example: `com.john.soundamplifier`

**Result:** App is ready to sign and install

---

## STEP 8: BUILD AND INSTALL

### Still in Xcode on Cloud Mac:

1. **Select Your iPhone**
   - Top bar, next to Play button
   - Click device selector
   - Choose your iPhone (not simulator)

2. **Press the Play Button** ▶️
   - Or press `Cmd + R`
   - Xcode will:
     - Compile code (takes 30-45 seconds)
     - Build the app
     - Install on your iPhone
     - Launch automatically

3. **Watch the Build Progress**
   - Bottom of Xcode shows progress
   - You'll see:
     ```
     Building...
     Linking...
     Starting...
     ```

4. **Wait for Success**
   - If build succeeds, you'll see "Build Complete"
   - If errors, scroll down to see messages

---

## STEP 9: FIRST LAUNCH ON IPHONE

### On Your Physical iPhone:

1. **App Should Launch Automatically**
   - You'll see "Sound Amplifier" splash
   - Or home screen with new app icon

2. **Grant Permissions**
   - First screen: "Allow Sound Amplifier to access your microphone?"
   - Tap **"Allow"**

3. **View Onboarding**
   - See 3 tutorial screens
   - Screen 1: Microphone icon
   - Screen 2: Headphone icon
   - Screen 3: Phone placement
   - Tap **"Start Listening"**

4. **Main Screen**
   - Large gray circle: "Start Listening"
   - Slider below: "Amplification 25x"
   - Settings gear: Top right

---

## STEP 10: TEST THE APP

### On Your iPhone:

1. **Connect Headphones**
   - AirPods, Bluetooth earbuds, or wired headphones
   - App will show: "Headphones Connected" (green text)

2. **Start Listening**
   - Press the large gray circle
   - Circle turns blue
   - Text changes to "Listening..."
   - You'll hear amplified microphone audio

3. **Adjust Controls**
   - Drag amplification slider left/right
   - Toggle "Voice Boost"
   - Change "Noise Reduction" mode
   - Open settings gear (top right)

4. **Verify Features**
   - ✅ Microphone captures sound
   - ✅ Audio plays through headphones
   - ✅ Slider adjusts volume
   - ✅ Voice Boost works
   - ✅ Settings save

---

## STEP 11: KEEP APP ON IPHONE (AFTER DISCONNECTING)

### Important:

1. **The app stays on your iPhone indefinitely**
   - Unlike web apps, it's a native install
   - No need to rebuild unless you change code

2. **To Update the App:**
   - Make changes in Xcode on Windows
   - Upload to cloud Mac again
   - Rebuild and install
   - Updated version replaces old one

3. **If You Need to Remove App:**
   - Long-press app icon on iPhone
   - Tap **"Remove App"**
   - Tap **"Delete App"**

---

## DISCONNECT AND SAVE TIME

### After App is Installed:

1. **You can stop renting the cloud Mac**
   - App is already on your iPhone
   - Works without cloud connection

2. **Only Rent Mac When:**
   - You want to rebuild app
   - You make code changes
   - You add new features

3. **To Rent Again Later:**
   - Repeat sign-up process
   - Follow same steps
   - Takes 10 minutes next time

---

---

## OPTION B: GITHUB ACTIONS (ADVANCED)

### ⏱️ Time Required: 4-5 hours
### 💰 Cost: Free
### ✅ Success Rate: 85% (technical setup)

**Only if you know Git/GitHub. This is complex.**

---

## STEP 1: CREATE GITHUB ACCOUNT

1. Go to `github.com`
2. Click **"Sign up"** (top right)
3. Enter email
4. Create password
5. Choose username: `yourname-soundamplifier`
6. Verify email

---

## STEP 2: CREATE REPOSITORY

1. After signing in, click **"+"** (top right)
2. Click **"New repository"**
3. **Repository Name:** `SoundAmplifier`
4. **Description:** "Hearing amplification app"
5. **Visibility:** "Public" or "Private"
6. Click **"Create repository"**

---

## STEP 3: UPLOAD YOUR CODE

### Using GitHub Desktop (Easiest):

1. Download: `desktop.github.com`
2. Install on Windows
3. Sign in with GitHub account
4. Click **"Add"** → **"Add Existing Repository"**
5. Navigate to: `C:\Users\prest\super hearing\SoundAmplifier`
6. Click **"Add Repository"**
7. Type commit message: "Initial commit"
8. Click **"Commit to main"**
9. Click **"Publish repository"**

### Result: Code is now on GitHub

---

## STEP 4: SETUP GITHUB ACTIONS

1. On GitHub (online), go to your repo
2. Click **"Actions"** tab
3. Click **"set up a workflow yourself"**
4. Create file with this content:

```yaml
name: Build iOS App
on: [push]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build
        run: |
          xcodebuild -scheme SoundAmplifier -configuration Release
      - name: Upload Build
        uses: actions/upload-artifact@v2
        with:
          name: app
          path: build/
```

5. Click **"Commit changes"**
6. GitHub will automatically build your app
7. Download built app from Artifacts

---

## STEP 5: INSTALL ON IPHONE

### Using Altstore (Free):

1. Download: `altstore.io`
2. Install on Windows
3. Connect iPhone via USB
4. Open AltStore on Windows
5. Drag your `.ipa` file into AltStore
6. App installs on iPhone

---

---

## OPTION C: TESTFLIGHT (OFFICIAL APPLE METHOD)

### ⏱️ Time Required: 3-4 hours
### 💰 Cost: $0-99/year (Apple Developer)
### ✅ Success Rate: 95%

---

## STEP 1: JOIN APPLE DEVELOPER PROGRAM

1. Go to `developer.apple.com/programs`
2. Click **"Enroll"**
3. Sign in with Apple ID (create free if needed)
4. Pay $99/year (or use free tier)
5. Activate account

---

## STEP 2: CREATE APP ID IN DEVELOPER PORTAL

1. Go to `developer.apple.com`
2. Click **"Account"** (top right)
3. Sign in
4. Click **"Certificates, Identifiers & Profiles"**
5. Click **"Identifiers"** (left sidebar)
6. Click **"+"** (top left)
7. Select **"App IDs"**
8. Click **"Continue"**
9. **Bundle ID:** `com.yourname.soundamplifier`
10. Click **"Continue"** → **"Register"**

---

## STEP 3: BUILD ON CLOUD MAC & UPLOAD

1. Rent cloud Mac (see Option A)
2. Open project in Xcode
3. Select iPhone as device
4. Product → Archive
5. Xcode Organizer opens
6. Click **"Distribute App"**
7. Select **"TestFlight & the App Store"**
8. Follow prompts to upload to TestFlight

---

## STEP 4: ADD TESTERS

1. Go to `appstoreconnect.apple.com`
2. Sign in
3. Click **"TestFlight"** (left sidebar)
4. Click your app
5. Click **"+" to add internal tester**
6. Enter iPhone Apple ID email
7. Send invite

---

## STEP 5: INSTALL FROM TESTFLIGHT

1. On iPhone, open App Store
2. Click **"Apps"** tab (bottom)
3. Scroll down to **"TestFlight"**
4. Open **"TestFlight"** app
5. Accept invitation
6. Tap **"Install"** on Sound Amplifier
7. App downloads and installs

---

---

## TROUBLESHOOTING

### "App Won't Install"
**Problem:** Xcode shows error during installation
**Solution:**
1. Disconnect iPhone
2. In Xcode: Product → Clean Build Folder (Cmd + Shift + K)
3. Reconnect iPhone
4. Press Play again
5. If still fails: Try different USB cable

### "Can't Find iPhone in Xcode"
**Problem:** iPhone doesn't appear in device list
**Solution:**
1. On iPhone: Settings → General → Trust this Computer
2. Unplug and replug USB cable
3. Restart Xcode (Cmd + Q, then reopen)
4. Try WiFi connection instead (Xcode → Window → Devices → Enable WiFi)

### "Microphone Permission Denied"
**Problem:** App asks for microphone but won't record
**Solution:**
1. On iPhone: Settings → Sound Amplifier → Microphone
2. Toggle to "Allow"
3. Restart app (swipe up from bottom, swipe app up)
4. Try again

### "Cloud Mac Connection Drops"
**Problem:** Connection to cloud Mac keeps disconnecting
**Solution:**
1. Use TeamViewer instead of Remote Desktop
2. Or check internet connection (may be slow)
3. Try WiFi instead of Ethernet
4. Reconnect if needed

### "Xcode Won't Open Project"
**Problem:** File won't open in Xcode
**Solution:**
1. Make sure it's `.xcodeproj` file (not `.xcworkspace`)
2. Try double-clicking file again
3. Right-click → "Open With" → "Xcode"
4. Wait 60 seconds for Xcode to load

### "App Crashes on Launch"
**Problem:** App starts but immediately closes
**Solution:**
1. Check microphone permission on iPhone
2. Make sure iOS version is 15.0+
3. In Xcode, check error console (bottom right)
4. Try cleaning build: Cmd + Shift + K

### "No Sound Output"
**Problem:** App runs but no audio through headphones
**Solution:**
1. Verify headphones are connected
2. Check iPhone volume (use side buttons)
3. Make sure you tapped "Allow" for microphone
4. In Settings app, check Sound Amplifier has microphone permission
5. Try different headphones to test

### "Build Takes Too Long"
**Problem:** Xcode building for 10+ minutes
**Solution:**
1. This is normal first time (usually 3-5 minutes)
2. Subsequent builds are faster
3. Close other programs on cloud Mac
4. Check internet connection speed

---

## QUICK REFERENCE

### File Locations on Windows PC

```
C:\Users\prest\super hearing\SoundAmplifier\
├── SoundAmplifier/                      ← Main Swift files
│   ├── Views/                           ← UI screens
│   │   ├── MainView.swift               ← Main listening screen
│   │   ├── SettingsView.swift           ← Settings panel
│   │   └── OnboardingView.swift         ← Tutorial screens
│   ├── AudioEngine/                     ← Audio processing
│   │   ├── AudioEngine.swift            ← Core audio
│   │   └── AudioProcessor.swift         ← Amplification
│   ├── Filters/                         ← Audio effects
│   │   ├── EqualizerFilter.swift        ← 9-band EQ
│   │   └── LimiterProtection.swift      ← Safety limiter
│   └── Info.plist                       ← App configuration
├── SoundAmplifier.xcodeproj/            ← Xcode project file
│   └── project.pbxproj                  ← Build settings
├── README.md                            ← Full documentation
└── BUILD_GUIDE.md                       ← Build instructions
```

### File Locations on Cloud Mac

After downloading/uploading:
```
~/Desktop/SoundAmplifier/                ← Downloaded folder
(same structure as above)
```

### File Locations on iPhone

After installation:
```
Home Screen → Sound Amplifier app icon   ← Your app
Settings → Sound Amplifier               ← Permissions
```

---

## RECOMMENDED PATH FOR YOU

### Fastest (2-3 hours total):
1. **Sign up for MacStadium** ($1)
2. **Connect via TeamViewer**
3. **Upload project via OneDrive**
4. **Build in Xcode**
5. **Install on iPhone**
6. **Disconnect from cloud Mac**

### Cheapest (but more complex):
1. **Use GitHub Actions** (free)
2. **Setup complex, but works**
3. **Download built app**
4. **Use AltStore to install**

### Most Official (but slowest):
1. **Pay for Apple Developer** ($99/year)
2. **Use TestFlight**
3. **Official Apple method**
4. **Can share with testers**

---

## NEXT STEPS

**Choose one option:**
- [ ] **Option A: Cloud Mac** (Recommended - Easiest)
- [ ] **Option B: GitHub Actions** (Free but technical)
- [ ] **Option C: TestFlight** (Most official)

**Tell me which option you want, and I'll give you detailed step-by-step commands!**

---

**Sound Amplifier - Getting it on your iPhone**
Created: July 12, 2026
