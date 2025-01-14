//
//  ContinuousSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/28/24.
//

import SwiftUI

public struct SingleContinuousSlider: View {
    public enum GlideLength: Double {
        case short = 0.6
        case moderate = 0.8
        case long = 0.95
    }
    
    public enum GlideResistance: Double {
        case low = 20000
        case moderate = 50000
        case high = 100000
    }
    
    // Slider value binding
    @Binding private var value: CGFloat
    public init(
        _ value: Binding<CGFloat>,
        glideLength: GlideLength = .moderate,
        glideResistance: GlideResistance = .moderate
    ) {
        self._value = value
        self.glideLength = glideLength
        self.glideResistance = glideResistance
    }
    
    @State private var previousTranlationX: CGFloat = 0
    @State private var velocityX: CGFloat = 0
    @State private var timer: Timer? = nil
    
    private let glideLength: GlideLength
    private let glideResistance: GlideResistance
    private let trackHeight: CGFloat = 20
    
    public var body: some View {
        GeometryReader { geometry in
            let activeWidth: CGFloat = value * geometry.size.width
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .fill(Color.SpenceKit.PrimaryForeground)
                    .frame(width: geometry.size.width, height: trackHeight)
                
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .fill(Color.SpenceKit.PrimaryAccent)
                    .frame(width: max(activeWidth, trackHeight / 2), height: trackHeight)
                Text(value.description)
            }.gesture(
                DragGesture()
                    .onEnded { gesture in
                        previousTranlationX = 0
                        startGlideIfNeeded()
                    }
                    .onChanged { gesture in
                        velocityX = gesture.velocity.width
                        let newValue = (gesture.translation.width - previousTranlationX) / geometry.size.width
                        let factor = abs(gesture.location.x - value  * geometry.size.width)
                        
                        withAnimation {
                            value = min(max(0, value + newValue * log10(factor + 1)), 1)
//                            value = newValue
                        }
                        previousTranlationX = gesture.translation.width
                    }
            )
        }.frame(height: trackHeight)
    }
    
    private func startGlideIfNeeded() {
        guard abs(velocityX) > 0 else { return }

        timer?.invalidate() // Ensure there's no existing timer running
        timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            DispatchQueue.main.async {
                if abs(velocityX) < 1 { // Stop if velocity is too small
                    self.timer?.invalidate()
                    self.timer = nil
                    return
                }

                // Reduce velocity and update position
                velocityX *= glideLength.rawValue
                let delta = (velocityX) / glideResistance.rawValue // Adjust factor as needed
                value = min(max(0, value + delta), 1) // Keep within 0 to 1 range

                // Ensure UI updates smoothly
                withAnimation {
                    value = value
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var from: CGFloat = 0
    @Previewable @State var to: CGFloat = 0.4
    SingleContinuousSlider($from, glideLength: .moderate, glideResistance: .moderate)
}
