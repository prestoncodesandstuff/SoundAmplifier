import SwiftUI

struct WaveformView: View {
    let dBLevel: Float
    
    var body: some View {
        Canvas { context in
            let width = context.size.width
            let height = context.size.height
            let midY = height / 2
            
            // Normalize dB level to amplitude (0 to 1)
            let normalizedLevel = (dBLevel + 80) / 80
            let amplitude = min(max(normalizedLevel, 0), 1) * (height / 3)
            
            var path = Path()
            let pointCount = Int(width / 4)
            
            for i in 0..<pointCount {
                let x = CGFloat(i) * 4
                let progress = CGFloat(i) / CGFloat(max(pointCount - 1, 1))
                
                // Create wave pattern with randomness
                let waveValue = sin(progress * .pi * 4) * amplitude
                let y = midY + waveValue
                
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addCurve(
                        to: CGPoint(x: x, y: y),
                        control1: CGPoint(x: x - 2, y: CGFloat.random(in: (midY - amplitude)...(midY + amplitude))),
                        control2: CGPoint(x: x - 2, y: CGFloat.random(in: (midY - amplitude)...(midY + amplitude)))
                    )
                }
            }
            
            // Draw waveform
            context.stroke(path, with: .color(.blue), lineWidth: 2)
            
            // Draw center line
            context.stroke(Path(ellipse: CGRect(x: 0, y: midY - 0.5, width: width, height: 1)), with: .color(.gray.opacity(0.3)))
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    WaveformView(dBLevel: -40)
        .frame(height: 80)
        .padding()
}
