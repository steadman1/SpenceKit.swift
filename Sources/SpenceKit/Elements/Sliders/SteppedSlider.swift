//
//  SteppedSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/28/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines SteppedSlider for piecewise range-based input
@available(iOS 17.0, *)
public struct SteppedSlider: View {
    public enum Count: Int {
        case single = 0
        case double = 1
    }
    // Slider value binding
    @Binding private var from: Double
    @Binding private var to: Double

    private let thumbCount: SteppedSlider.Count

    public init(_ value: Binding<Double>) {
        self._from = .constant(0)
        self._to = value
        self.thumbCount = .single
    }

    public init(from: Binding<Double>, to: Binding<Double>) {
        self._from = from
        self._to = to
        self.thumbCount = .double
    }

    private let range: ClosedRange<Double> = 0...1
    private let thumbHeights: ClosedRange<CGFloat> = 12...24
    private let trackHeight: CGFloat = 8

    public var body: some View {
        GeometryReader { geometry in
            ZStack {

            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var from: Double = 0
    @Previewable @State var to: Double = 0.4
    SteppedSlider($from)
    SteppedSlider(from: $from, to: $to)
}

#endif
