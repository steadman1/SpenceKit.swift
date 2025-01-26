//
//  SingleContinuousSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/28/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines ContinuousSlider for continous range-based input—sister View of Slider
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
    @Binding private var value: Double
    
    public init(
        _ value: Binding<Double>,
        style: SpenceKitStyle = .CTA,
        range: ClosedRange<Double> = 0...10,
        decimalCount: Int = 1,
        glideLength: GlideLength = .moderate,
        glideResistance: GlideResistance = .moderate
    ) {
        self.style = style
        self._value = value
        self.range = range
        self.decimalCount = decimalCount
        self.glideLength = glideLength
        self.glideResistance = glideResistance
    }
    
    @State private var previousTranlationX: CGFloat = 0
    @State private var velocityX: CGFloat = 0
    @State private var timer: Timer? = nil
    
    private let style: SpenceKitStyle
    private let range: ClosedRange<Double>
    private let decimalCount: Int
    private let glideLength: GlideLength
    private let glideResistance: GlideResistance
    private let trackHeight: CGFloat = 16
    
    public var body: some View {
        let valueDescription = (value * (range.upperBound - range.lowerBound) + range.lowerBound).format(decimalPlaces: decimalCount)
        let stringSize = valueDescription.stringSize(usingFont: UIFont.SpenceKit.SansHintFont, withTraits: [.traitBold])
        let lowerBoundSize = range.lowerBound.description.stringSize(usingFont: UIFont.SpenceKit.SansHintFont, withTraits: [])
        let upperBoundSize = range.upperBound.description.stringSize(usingFont: UIFont.SpenceKit.SansHintFont, withTraits: [])
        let primaryHeight = SpenceKit.Constants.spacing4 * 2 + trackHeight + stringSize.height + max(lowerBoundSize.height, upperBoundSize.height)
        GeometryReader { geometry in
            let offset = max(
                0,
                min(
                    value * geometry.size.width - stringSize.width / 2,
                    geometry.size.width - stringSize.width
                )
            )
            VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing4) {
                if style == .primary {
                    valueText(valueDescription)
                        .foregroundStyle(Color.SpenceKit.PrimaryText)
                        .offset(x: offset)
                }
                
                let activeWidth: CGFloat = value * (geometry.size.width  - (style == .secondary ? upperBoundSize.width - 4: 0))
                HStack(spacing: 0) {
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                            .fill(style == .tertiary ? Color.SpenceKit.SecondaryAccent : Color.SpenceKit.PrimaryAccent)
                            .frame(
                                width: max(
                                    activeWidth,
                                    style != .primary
                                    ? stringSize.width + 8
                                    : trackHeight / 2
                                ),
                                height: trackHeight
                            )
                        if style != .primary {
                            valueText(valueDescription)
                                .fixedSize()
                                .foregroundStyle(style == .secondary ? Color.SpenceKit.Background : Color.SpenceKit.PrimaryAccent)
                                .padding(.horizontal, SpenceKit.Constants.padding4)
                        }
                    }
                    let opacity = activeWidth + trackHeight * 2 > geometry.size.width ? (geometry.size.width - activeWidth - trackHeight) / trackHeight : 1
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                            .fill(Color.SpenceKit.PrimaryForeground)
                            .frame(
                                width: max(
                                    min(
                                        geometry.size.width - activeWidth,
                                        geometry.size.width - (
                                            style != .primary
                                            ? stringSize.width + 8
                                            : trackHeight / 2)
                                    ) - (style == .secondary ? upperBoundSize.width - 4 : 0),
                                    0
                                ),
                                height: trackHeight
                            )
                        if style == .tertiary {
                            Text(range.upperBound.format(decimalPlaces: 0))
                                .fixedSize()
                                .font(Font.SpenceKit.HintFont)
                                .foregroundStyle(Color.SpenceKit.TertiaryText)
                                .padding(.horizontal, SpenceKit.Constants.padding4)
                        }
                    }.opacity(opacity)
                    
                    if style == .secondary {
                        Text(range.upperBound.format(decimalPlaces: 0))
                            .fixedSize()
                            .font(Font.SpenceKit.HintFont)
                            .foregroundStyle(Color.SpenceKit.SecondaryText)
                            .padding(.leading, SpenceKit.Constants.padding4)
                    }
                }.gesture(
                        DragGesture()
                            .onEnded { gesture in
                                previousTranlationX = 0
                                startGlideIfNeeded()
                            }
                            .onChanged { gesture in
                                velocityX = gesture.velocity.width
                                let newValue = (gesture.translation.width - previousTranlationX) / geometry.size.width
                                let factor = abs(gesture.location.x - value * geometry.size.width)
                                
                                withAnimation(.SpenceKit.Bouncy.quick) {
                                    value = min(max(0, value + newValue * log10(factor)), 1)
                                }
                                previousTranlationX = gesture.translation.width
                            }
                        )
                if style == .primary {
                    HStack {
                        Text(range.lowerBound.format(decimalPlaces: 0))
                            .font(Font.SpenceKit.HintFont)
                            .foregroundStyle(Color.SpenceKit.SecondaryText)
                        Spacer()
                        Text(range.upperBound.format(decimalPlaces: 0))
                            .font(Font.SpenceKit.HintFont)
                            .foregroundStyle(Color.SpenceKit.SecondaryText)
                    }
                }
            }
        }.frame(height: style == .primary ? primaryHeight : trackHeight)
    }
    
    @ViewBuilder
    private func valueText(_ text: String) -> some View {
        if #available(iOS 16.0, *) {
            Text(text)
                .font(Font.SpenceKit.HintFont)
                .fontWeight(.bold)
        } else {
            Text(text)
                .font(Font.SpenceKit.HintFont.weight(.bold))
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
    @Previewable @State var from: Double = 0
    @Previewable @State var to: Double = 0.4
    VStack {
        ContinuousSlider($from, style: .primary, glideLength: .long, glideResistance: .low)
        ContinuousSlider($from, style: .secondary, glideLength: .long, glideResistance: .low)
        ContinuousSlider($from, style: .tertiary, glideLength: .long, glideResistance: .low)
    }.padding(50)
}


#endif
