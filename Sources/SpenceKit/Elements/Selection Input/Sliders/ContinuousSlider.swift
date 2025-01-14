//
//  SingleContinuousSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/28/24.
//

import SwiftUI

public struct ContinuousSlider: View {
    public enum GlideLength: Double {
        case none = 0
        case short = 0.6
        case moderate = 0.8
        case long = 0.95
    }
    
    public enum GlideResistance: Double {
        case low = 20000
        case moderate = 50000
        case high = 100000
        case infinity = 0
    }
    
    // Slider value binding
    @Binding private var value: CGFloat
    
    public init(
        _ value: Binding<CGFloat>,
        range: ClosedRange<Double> = 1...100,
        decimalCount: Int = 0,
        glideLength: GlideLength = .moderate,
        glideResistance: GlideResistance = .moderate
    ) {
        self._value = value
        self.range = range
        self.decimalCount = decimalCount
        self.glideLength = glideLength
        self.glideResistance = glideResistance
    }
    
    @State private var previousTranlationX: CGFloat = 0
    @State private var velocityX: CGFloat = 0
    @State private var timer: Timer? = nil
    
    private let range: ClosedRange<Double>
    private let decimalCount: Int
    private let glideLength: GlideLength
    private let glideResistance: GlideResistance
    private let trackHeight: CGFloat = 16
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                let valueDescription = (value * (range.upperBound - range.lowerBound) + range.lowerBound).format(decimalPlaces: decimalCount)
                let stringSize = valueDescription.stringSize(usingFont: UIFont.SpenceKit.SansBodyFont, withTraits: [.traitBold]).width
                let offset = max(
                    0,
                    min(
                        value * geometry.size.width - stringSize / 2,
                        geometry.size.width - stringSize
                    )
                )
                if #available(iOS 16.0, *) {
                    Text(valueDescription)
                        .font(Font.SpenceKit.SansBodyFont.weight(.bold))
                        .foregroundStyle(Color.SpenceKit.PrimaryText)
                        .fontWeight(.bold)
                        .offset(x: offset)
                } else {
                    Text(valueDescription)
                        .font(Font.SpenceKit.SansHintFont)
                        .foregroundStyle(Color.SpenceKit.PrimaryText)
                        .offset(x: offset)
                }
                
                let activeWidth: CGFloat = value * geometry.size.width
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryAccent)
                        .frame(width: max(activeWidth, trackHeight / 2), height: trackHeight)
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryForeground)
                        .frame(width: max(geometry.size.width - activeWidth, trackHeight), height: trackHeight)
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
                                
                                withAnimation(.SpenceKit.Bouncy.quick) {
                                    value = min(max(0, value + newValue * log10(factor)), 1)
                                }
                                previousTranlationX = gesture.translation.width
                            }
                        )
                
                HStack {
                    Text(range.lowerBound.format(decimalPlaces: 0))
                        .font(Font.SpenceKit.SansHintFont)
                        .foregroundStyle(Color.SpenceKit.SecondaryText)
                    Spacer()
                    Text(range.upperBound.format(decimalPlaces: 0))
                        .font(Font.SpenceKit.SansHintFont)
                        .foregroundStyle(Color.SpenceKit.SecondaryText)
                }
            }
        }
    }
    
    private func startGlideIfNeeded() {
        guard abs(velocityX) > 10, glideLength != .none || glideResistance != .infinity else { return }

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
                withAnimation(.SpenceKit.Bouncy.slow) {
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
    ContinuousSlider($from, glideLength: .long, glideResistance: .low)
}
