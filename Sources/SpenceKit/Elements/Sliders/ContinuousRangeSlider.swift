//
//  ContinuousRangeSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/13/25.
//


#if canImport(SwiftUI)

import SwiftUI

/// Defines ContinuousRangeSlider for continuous range-based input—try not to use this!
@available(*, deprecated, message: "visually buggy, so not officially supported—also not sure what this would even be used for lmao")
public struct ContinuousRangeSlider: View {
    private enum ThumbPosition: Int {
        case from = 0
        case to = 1
    }
    // Slider value binding
    @Binding private var from: Double
    @Binding private var to: Double

    @State private var draggingPosition: ThumbPosition? = nil
    @State private var previousTranlationX: [CGFloat] = [0, 0]
    @State private var velocityX: [CGFloat] = [0, 0]
    @State private var timer: Timer? = nil

    public init(
        from: Binding<Double>,
        to: Binding<Double>,
        range: ClosedRange<Double> = 100...1000,
        decimalCount: Int = 0,
        glideLength: ContinuousSlider.GlideLength = .moderate,
        glideResistance: ContinuousSlider.GlideResistance = .moderate
    ) {
        self._from = from
        self._to = to
        self.range = range
        self.decimalCount = decimalCount
        self.glideLength = glideLength
        self.glideResistance = glideResistance
    }

    private let range: ClosedRange<Double>
    private let decimalCount: Int
    private let glideLength: ContinuousSlider.GlideLength
    private let glideResistance: ContinuousSlider.GlideResistance
    private let trackHeight: CGFloat = 16
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                let activeWidth: CGFloat = abs(to - from) * geometry.size.width
                
                let toDescription = (to * (range.upperBound - range.lowerBound) + range.lowerBound).format(decimalPlaces: decimalCount)
                let toStringSize = toDescription.stringSize(usingFont: UIFont.SpenceKit.SansHeadFont, withTraits: [.traitBold]).width
                let fromDescription = (from * (range.upperBound - range.lowerBound) + range.lowerBound).format(decimalPlaces: decimalCount)
                let fromStringSize = toDescription.stringSize(usingFont: UIFont.SpenceKit.SansHeadFont, withTraits: [.traitBold]).width
                
                let toOffset = max(
                    0,
                    min(
                        to * geometry.size.width - toStringSize / 2,
                        geometry.size.width - toStringSize
                    )
                )
                let fromOffset = max(
                    0,
                    min(
                        from * geometry.size.width - fromStringSize / 2,
                        geometry.size.width - fromStringSize
                    )
                )
                
                ZStack(alignment: .leading) {
                    let paddedStringSize: CGFloat = (toStringSize * 2)
                    let opacity: CGFloat = activeWidth < paddedStringSize
                    ? (1 - (paddedStringSize - activeWidth) / paddedStringSize * 1.5)
                        : 1
                    Group {
                        if #available(iOS 16.0, *) {
                            Text(toDescription)
                                .font(Font.SpenceKit.HeadFont)
                                .foregroundStyle(Color.SpenceKit.PrimaryText)
                                .fontWeight(.bold)
                                .offset(x: toOffset)
                        } else {
                            Text(toDescription)
                                .font(Font.SpenceKit.HintFont.weight(.bold))
                                .foregroundStyle(Color.SpenceKit.PrimaryText)
                                .offset(x: toOffset)
                        }
                    }.opacity(opacity)
                    
                    Group {
                        if #available(iOS 16.0, *) {
                            Text(fromDescription)
                                .font(Font.SpenceKit.HeadFont)
                                .foregroundStyle(Color.SpenceKit.PrimaryText)
                                .fontWeight(.bold)
                                .offset(x: fromOffset)
                        } else {
                            Text(fromDescription)
                                .font(Font.SpenceKit.HintFont.weight(.bold))
                                .foregroundStyle(Color.SpenceKit.PrimaryText)
                                .offset(x: fromOffset)
                        }
                    }
                }
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryForeground)
                        .frame(width: geometry.size.width, height: trackHeight)
                    
                    let thumbWidth = trackHeight * 1.5
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryAccent)
                        .offset(
                            x: (
                                to - from >= 0
                                ? min(
                                    from,
                                    to - thumbWidth / geometry.size.width
                                )
                                : to
                            ) * geometry.size.width
                        )
                        .frame(
                            width: max(activeWidth, thumbWidth),
                            height: trackHeight
                        ).gesture(
                            DragGesture()
                                .onEnded { gesture in
                                    let pos = getPosition(
                                        with: gesture.location.x,
                                        geometry: geometry
                                    )
                                    let value = getValue(from: pos)
                                    previousTranlationX[pos.rawValue] = 0
                                    startGlideIfNeeded(
                                        value.0,
                                        value.1,
                                        position: pos
                                    )
                                    draggingPosition = nil
                                }
                                .onChanged { gesture in
                                    let pos = getPosition(
                                        with: gesture.location.x,
                                        geometry: geometry
                                    )
                                    let value = getValue(from: pos)
                                    velocityX[pos.rawValue] = gesture.velocity.width
                                    let newValue = (gesture.translation.width - previousTranlationX[pos.rawValue]) / geometry.size.width

                                    withAnimation(.SpenceKit.Bouncy.quick) {
                                        if pos == .from && value.0.wrappedValue + newValue < value.1.wrappedValue {
                                            
                                            value.0.wrappedValue = min(
                                                max(
                                                    0,
                                                    value.0.wrappedValue + newValue
                                                   ),
                                                1
                                            )
                                        } else if pos == .to && value.0.wrappedValue + newValue > value.1.wrappedValue {
                                            
                                            value.0.wrappedValue = min(
                                                max(
                                                    0,
                                                    value.0.wrappedValue + newValue
                                                   ),
                                                1
                                            )
                                        }
                                    }
                                    previousTranlationX[pos.rawValue] = gesture.translation.width
                                    draggingPosition = pos
                                }
                        )
                }
                
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
        }.frame(height: trackHeight)
    }
    
    private func getPosition(
        with location: CGFloat,
        geometry: GeometryProxy
    ) -> ThumbPosition {
        if draggingPosition != nil { return draggingPosition! }
        let activeWidth = (to - from) * geometry.size.width
        return activeWidth / 2 > (location - from * geometry.size.width) ? .from : .to
    }

    private func getValue(from position: ThumbPosition) -> (Binding<Double>, Binding<Double>) {
        switch position {
        case .from:
            return ($from, $to)
        case .to:
            return ($to, $from)
        }
    }
    
    private func startGlideIfNeeded(
        _ primary: Binding<Double>,
        _ secondary: Binding<Double>,
        position: ThumbPosition
    ) {
        guard abs(velocityX[position.rawValue]) > 10, glideLength != .none || glideResistance != .infinity else {
            finishGlide()
            return
        }

        timer?.invalidate() // Ensure there's no existing timer running
        timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            DispatchQueue.main.async {
                if abs(velocityX[position.rawValue]) < 1 { // Stop if velocity is too small
                    finishGlide()
                    return
                }

                // Reduce velocity and update position
                velocityX[position.rawValue] *= glideLength.rawValue
                let delta = (velocityX[position.rawValue]) / glideResistance.rawValue // Adjust factor as needed
                
                guard position == .from && primary.wrappedValue + delta < secondary.wrappedValue
                        || position == .to && primary.wrappedValue + delta > secondary.wrappedValue else {
                    primary.wrappedValue = secondary.wrappedValue
                    
                    withAnimation(.SpenceKit.Bouncy.slow) {
                        primary.wrappedValue = primary.wrappedValue
                    }
                    finishGlide()
                    return
                }
                
                primary.wrappedValue = min(max(0, primary.wrappedValue + delta), 1) // Keep within 0 to 1 range

                // Ensure UI updates smoothly
                withAnimation(.SpenceKit.Bouncy.slow) {
                    primary.wrappedValue = primary.wrappedValue
                }
            }
        }
    }
    
    func finishGlide() {
        timer?.invalidate()
        timer = nil
        velocityX[ThumbPosition.from.rawValue] = 0
        velocityX[ThumbPosition.to.rawValue] = 0
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var from: Double = 0
    @Previewable @State var to: Double = 0.4
    ContinuousRangeSlider(
        from: $from,
        to: $to,
        glideLength: .long,
        glideResistance: .low
    )
}

#endif
