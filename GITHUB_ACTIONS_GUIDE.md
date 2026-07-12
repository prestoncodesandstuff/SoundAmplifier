# 🚀 GITHUB ACTIONS BUILD GUIDE - FREE iOS APP BUILD

**Status:** ✅ Complete free method using GitHub Actions
**Cost:** $0
**Time:** 2-3 hours
**Difficulty:** Medium (but step-by-step guide makes it easy)

---

## 🎯 WHAT GITHUB ACTIONS WILL DO

GitHub's cloud servers will:
1. ✅ Get your code from GitHub
2. ✅ Build the iOS app automatically 
3. ✅ Create the `.ipa` file (app package)
4. ✅ Let you download it
5. ✅ You install on iPhone using AltStore

**No Mac needed. No rental fees. Completely free.** 🆓

---

## 📋 PREREQUISITES

Before starting, you need:
- [ ] GitHub account (free to create)
- [ ] Your Windows PC
- [ ] iPhone with USB cable
- [ ] About 2-3 hours

---

## 🔧 STEP-BY-STEP SETUP

### **PART 1: CREATE GITHUB ACCOUNT (5 minutes)**

**Step 1.1:** Go to GitHub
- Open: https://github.com
- Click: "Sign up" (top right)

**Step 1.2:** Create account
- Enter email: Any email address
- Create password: Something strong
- Username: Anything you like
- Click: "Create account"

**Step 1.3:** Verify email
- Check your email inbox
- Click verify link from GitHub
- Done! ✅

---

### **PART 2: UPLOAD YOUR CODE (10 minutes)**

**Step 2.1:** Create new repository
- Log in to GitHub
- Click: "+" icon (top right)
- Click: "New repository"

**Step 2.2:** Configure repository
- **Repository name:** SoundAmplifier
- **Description:** Free iOS hearing amplifier app
- **Public/Private:** Public (must be public for free Actions)
- Click: "Create repository"

**Step 2.3:** Get your repository URL
- After creating, you'll see: `https://github.com/YOUR-USERNAME/SoundAmplifier`
- Copy this URL - you'll need it

**Step 2.4:** Upload your code on Windows
- Open PowerShell on Windows
- Navigate to your project:
  ```powershell
  cd "C:\Users\prest\super hearing"
  ```

**Step 2.5:** Initialize Git
- Run these commands one by one:
  ```powershell
  cd SoundAmplifier
  git init
  git add .
  git commit -m "Initial Sound Amplifier iOS app"
  git branch -M main
  git remote add origin https://github.com/YOUR-USERNAME/SoundAmplifier.git
  git push -u origin main
  ```

**Step 2.6:** Enter GitHub credentials
- When prompted for password:
  - Username: Your GitHub username
  - Password: Create a Personal Access Token (see below)

**Step 2.7:** Create Personal Access Token
- Go to: https://github.com/settings/tokens
- Click: "Generate new token"
- Select: "repo" checkbox ✓
- Click: "Generate token"
- Copy the token
- Use as password in PowerShell

**Result:** Your code is now on GitHub! ✅

---

### **PART 3: CREATE GITHUB ACTIONS WORKFLOW (15 minutes)**

**Step 3.1:** Create workflows folder
- On GitHub, click "Add file" → "Create new file"
- File path: `.github/workflows/build.yml`
- (Type the full path including .github/workflows/)

**Step 3.2:** Add this workflow configuration

Copy and paste this entire content:

```yaml
name: Build iOS App

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: macos-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v3
    
    - name: Setup Xcode
      uses: maxim-lobanov/setup-xcode@v1
      with:
        xcode-version: latest
    
    - name: Install dependencies
      run: |
        brew install cocoapods
        pod install
      working-directory: ./SoundAmplifier
      continue-on-error: true
    
    - name: Build iOS App
      run: |
        xcodebuild -workspace SoundAmplifier.xcworkspace -scheme SoundAmplifier -sdk iphoneos -configuration Release -derivedDataPath build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO
      working-directory: ./SoundAmplifier
    
    - name: Create IPA
      run: |
        mkdir -p Payload
        cp -r build/Release-iphoneos/SoundAmplifier.app Payload/SoundAmplifier.app
        zip -r SoundAmplifier.ipa Payload/
      working-directory: ./SoundAmplifier
    
    - name: Upload IPA as artifact
      uses: actions/upload-artifact@v3
      with:
        name: SoundAmplifier-app
        path: ./SoundAmplifier/SoundAmplifier.ipa
        retention-days: 30
    
    - name: Create Release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: v1.0.0-${{ github.run_number }}
        release_name: SoundAmplifier Build ${{ github.run_number }}
        body: |
          Build successful!
          Download the IPA file from artifacts
        draft: false
        prerelease: false
```

**Step 3.3:** Commit the workflow
- Click "Commit new file"
- Message: "Add GitHub Actions build workflow"

**Result:** GitHub will automatically start building! ✅

---

### **PART 4: MONITOR THE BUILD (30-45 minutes)**

**Step 4.1:** Go to Actions
- On your GitHub repository
- Click: "Actions" tab

**Step 4.2:** Watch the build
- You'll see: "Build iOS App" running
- Status shows: 🟡 (running) → 🟢 (success) or 🔴 (failed)

**Step 4.3:** Wait for completion
- First build takes: 30-45 minutes
- Future builds: 15-20 minutes
- Status page updates automatically

**Step 4.4:** If build fails
- Click on the failed job
- Scroll down to see error message
- Troubleshooting section at bottom of this guide

---

### **PART 5: DOWNLOAD YOUR APP (5 minutes)**

**Step 5.1:** Get the built app
- When build is green ✅ (completed successfully)
- Click on the successful job
- Scroll down to "Artifacts"
- Download: `SoundAmplifier-app`

**Step 5.2:** Extract the IPA
- On Windows: Right-click ZIP → "Extract All"
- File you need: `SoundAmplifier.ipa`

**Step 5.3:** Move to safe location
- Copy `SoundAmplifier.ipa` to:
  ```
  C:\Users\prest\Downloads\SoundAmplifier.ipa
  ```

---

### **PART 6: INSTALL ON IPHONE USING ALTSTORE (30 minutes)**

**Step 6.1:** Install AltStore on Windows
- Go to: https://altstore.io
- Download: "AltStore for Windows"
- Run installer: `AltStore-Installer.exe`
- Follow setup wizard

**Step 6.2:** Start AltServer
- After installation, AltServer runs in background
- Right-click system tray → "AltStore" appears
- Click: "AltStore"

**Step 6.3:** Connect iPhone via USB
- Plug iPhone into Windows PC with USB cable
- Trust the computer when prompted on iPhone

**Step 6.4:** Install IPA via AltStore
- Right-click system tray → AltStore
- Click: "Install IPA"
- Browse to: `SoundAmplifier.ipa`
- Click "Open"
- Sign in with Apple ID when prompted

**Step 6.5:** Wait for installation
- iPhone shows installation progress
- Takes 5-10 minutes
- App appears on home screen when done ✅

---

## ✅ YOU NOW HAVE THE APP!

**Your iPhone now has Sound Amplifier!**

### Test it:
1. Open Sound Amplifier app on iPhone
2. Tap the big blue button "Start Listening"
3. Connect headphones
4. Adjust amplification slider
5. Try voice boost and noise reduction

---

## 🔄 UPDATING THE APP (Future builds)

**To rebuild with changes:**

**Method 1: Push code to GitHub (Automatic)**
```powershell
# On Windows in SoundAmplifier folder:
git add .
git commit -m "Description of changes"
git push
# GitHub Actions automatically builds
# Download when complete
```

**Method 2: Trigger manually on GitHub**
- Go to Actions tab
- Click "Build iOS App"
- Click "Run workflow"
- Click "Run workflow" button

---

## 🐛 TROUBLESHOOTING

### **Build Failed - Compilation Error**

**Problem:** Red ❌ status in Actions

**Solution 1:** Check error message
1. Click failed job
2. Scroll to see error
3. Most common: Signing issues (ignore - using unsigned build)

**Solution 2:** Try again
- Code might have small syntax issue
- Fix the Swift file on Windows
- Push again: `git add . && git commit -m "fix" && git push`
- GitHub automatically rebuilds

**Solution 3:** Check Info.plist
- Ensure Info.plist has required permissions
- `NSMicrophoneUsageDescription` must be present
- Push and rebuild

---

### **AltStore Won't Connect to iPhone**

**Problem:** iPhone doesn't appear in AltStore

**Solution 1:** Trust computer on iPhone
- Unlock iPhone
- Tap "Trust" when prompted
- Keep iPhone unlocked during install

**Solution 2:** Restart AltServer
- Right-click system tray
- Click "AltStore" → "Restart AltServer"
- Reconnect iPhone

**Solution 3:** Use different USB cable
- Try a different USB cable
- Some cables are charging-only

---

### **IPA Download Shows 404 Error**

**Problem:** Can't download IPA file

**Solution:** 
- Build must be green ✅ first
- Wait for build to fully complete
- Don't download before success status shows
- Try again after 5 minutes

---

### **App Won't Launch on iPhone**

**Problem:** App crashes on startup

**Solution 1:** Check Microphone Permission
- Go to: iPhone Settings → Privacy → Microphone
- Tap "Sound Amplifier"
- Turn ON: ✓ Allow Microphone Access

**Solution 2:** Check Info.plist
- Ensure `NSMicrophoneUsageDescription` exists
- Rebuild if changed

**Solution 3:** Reinstall app
- Delete app from iPhone
- Reinstall using AltStore
- Follow Part 6 again

---

### **GitHub Actions Keeps Failing**

**Problem:** Build always shows red ❌

**Solution 1:** Check file structure
- Make sure `SoundAmplifier.xcodeproj` exists at root level
- Check: Your GitHub `/SoundAmplifier/` folder has `SoundAmplifierApp.swift` and other files

**Solution 2:** Verify code syntax
- Build locally on Windows with Swift compiler (if available)
- Or check for obvious Swift syntax errors

**Solution 3:** Simplify workflow
- Try GitHub Actions workflow for unsigned builds only
- Signing issues are common but shouldn't stop build

---

## 📊 TIMING BREAKDOWN

| Step | Time |
|------|------|
| Create GitHub account | 5 min |
| Upload code to GitHub | 10 min |
| Create GitHub Actions workflow | 15 min |
| First build (GitHub Actions) | 45 min |
| Download IPA | 5 min |
| Install AltStore on Windows | 10 min |
| Install app on iPhone | 10 min |
| **TOTAL** | **~2 hours** |

---

## 💾 TOTAL COST

| Item | Cost |
|------|------|
| GitHub account | FREE |
| GitHub Actions builds | FREE |
| AltStore | FREE |
| App on iPhone | FREE |
| **TOTAL** | **$0** ✅ |

---

## 🎯 QUICK REFERENCE

### If you just want to know:

**"Is the app on my iPhone?"**
1. Go to Actions on GitHub → Check if green ✅
2. Download IPA from artifacts
3. Install via AltStore
4. Open app on iPhone

**"How do I update the app?"**
1. Change code on Windows
2. Push to GitHub: `git push`
3. GitHub rebuilds automatically
4. Download new IPA
5. Reinstall via AltStore

**"Something's not working"**
1. Check "Troubleshooting" section above
2. Find your problem
3. Follow solution
4. Try again

---

## 🚀 START HERE

### Right Now:

1. **Create GitHub account**
   - Go to: https://github.com/signup
   - Takes: 5 minutes

2. **Upload your code**
   - Create repository named: SoundAmplifier
   - Run git commands (shown in Part 2)
   - Takes: 10 minutes

3. **Create GitHub Actions workflow**
   - Add `.github/workflows/build.yml` file
   - Paste the YAML from Part 3
   - Takes: 15 minutes

4. **Wait for build**
   - Go to Actions tab
   - Watch build progress
   - Takes: 45 minutes

5. **Download IPA**
   - Get `SoundAmplifier-app` from artifacts
   - Takes: 5 minutes

6. **Install on iPhone**
   - Install AltStore on Windows
   - Use AltStore to install IPA
   - Takes: 15-20 minutes

7. **Test app**
   - Open Sound Amplifier on iPhone
   - Try all features
   - Done! ✅

---

## ✅ FINAL CHECKLIST

- [ ] GitHub account created
- [ ] Code uploaded to GitHub
- [ ] GitHub Actions workflow created
- [ ] Build completed (green ✅)
- [ ] IPA downloaded
- [ ] AltStore installed on Windows
- [ ] App installed on iPhone
- [ ] App tested and working

---

## 🎉 YOU DID IT!

**You've built an iOS app from Windows using GitHub Actions for FREE!**

No Mac needed. No rental fees. 100% cloud-based build.

Your Sound Amplifier app is now on your iPhone. 🎧

---

**GitHub Actions Method - Complete Guide**

✅ Free
✅ Automatic
✅ Cloud-based  
✅ No Mac required
✅ Easy to update

**Status:** Ready to start! 🚀
