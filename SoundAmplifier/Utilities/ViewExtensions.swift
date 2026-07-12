import SwiftUI

// MARK: - Color Utilities
extension Color {
    static let brandBlue = Color.blue
    static let darkBackground = Color(UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1))
    static let cardBackground = Color(UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1))
}

// MARK: - Shape Extensions
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Haptic Feedback
class HapticManager {
    static let shared = HapticManager()
    
    func light() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    func medium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func heavy() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
}

// MARK: - Number Formatting
extension Double {
    func formattedAsDB() -> String {
        String(format: "%.1f dB", self)
    }
    
    func formattedAsAmplification() -> String {
        String(format: "%.0fx", self)
    }
}
