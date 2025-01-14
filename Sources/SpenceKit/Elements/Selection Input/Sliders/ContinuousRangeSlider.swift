//
//  ContinuousRangeSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/13/25.
//


import SwiftUI

public struct ContinuousRangeSlider: View {
    private enum ThumbPosition: Int {
        case from = 0
        case to = 1
    }
    // Slider value binding
    @Binding private var from: Double
    @Binding private var to: Double

    @State private var previousTranlationX: [CGFloat] = [0, 0]
    @State private var velocityX: [CGFloat] = [0, 0]
    @State private var timer: Timer? = nil

    public init(
        from: Binding<Double>,
        to: Binding<Double>,
        range: ClosedRange<Double> = 0...1,
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
            VStack {
                Text("from: \(from)—to: \(to)")
                let activeWidth: CGFloat = abs(to - from) * geometry.size.width
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryForeground)
                        .frame(width: geometry.size.width, height: trackHeight)
                    
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .fill(Color.SpenceKit.PrimaryAccent)
                        .offset(x: (to - from > 0 ? from : to) * geometry.size.width)
                        .frame(width: max(activeWidth, trackHeight), height: trackHeight)
                        .gesture(
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
                                        value.0.wrappedValue = min(
                                            max(
                                                0,
                                                value.0.wrappedValue + newValue
                                               ),
                                            1
                                        )
                                    }
                                    previousTranlationX[pos.rawValue] = gesture.translation.width
                                }
                        )
                }
            }
        }.frame(height: trackHeight)
    }
    
    private func getPosition(
        with location: CGFloat,
        geometry: GeometryProxy
    ) -> ThumbPosition {
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
            velocityX[position.rawValue] = 0
            return
        }

        timer?.invalidate() // Ensure there's no existing timer running
        timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            DispatchQueue.main.async {
                if abs(velocityX[position.rawValue]) < 1 { // Stop if velocity is too small
                    self.timer?.invalidate()
                    self.timer = nil
                    velocityX[position.rawValue] = 0
                    return
                }

                // Reduce velocity and update position
                velocityX[position.rawValue] *= glideLength.rawValue
                let delta = (velocityX[position.rawValue]) / glideResistance.rawValue // Adjust factor as needed
                primary.wrappedValue = min(max(0, primary.wrappedValue + delta), 1) // Keep within 0 to 1 range

                // Ensure UI updates smoothly
                withAnimation(.SpenceKit.Bouncy.slow) {
                    primary.wrappedValue = primary.wrappedValue
                }
            }
        }
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
