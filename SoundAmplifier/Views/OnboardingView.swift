import SwiftUI

struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @State private var currentPage = 0
    
    let pages: [OnboardingPage] = [
        OnboardingPage(
            icon: "mic.circle.fill",
            title: "Turn your phone into a sound amplifier",
            description: "Enhance surrounding sounds and make voices easier to hear."
        ),
        OnboardingPage(
            icon: "headphones",
            title: "Connect headphones",
            description: "For the best experience, connect AirPods, Bluetooth earbuds, or wired headphones."
        ),
        OnboardingPage(
            icon: "iphone.radiowaves.left.and.right",
            title: "Place your phone near the sound",
            description: "Your phone microphone captures sound and sends enhanced audio to your headphones."
        )
    ]
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
                
                // Page Indicators
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.blue : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                .padding(.bottom, 20)
                
                // Next/Start Button
                Button(action: {
                    if currentPage < pages.count - 1 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                        withAnimation {
                            hasSeenOnboarding = true
                        }
                    }
                }) {
                    Text(currentPage == pages.count - 1 ? "Start Listening" : "Next")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(16)
            }
        }
    }
}

struct OnboardingPage {
    let icon: String
    let title: String
    let description: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Image(systemName: page.icon)
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            VStack(spacing: 12) {
                Text(page.title)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text(page.description)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
        .padding(32)
    }
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(false))
}
