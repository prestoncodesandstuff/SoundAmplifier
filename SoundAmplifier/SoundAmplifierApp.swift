import SwiftUI

@main
struct SoundAmplifierApp: App {
    @State private var hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainView()
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}
