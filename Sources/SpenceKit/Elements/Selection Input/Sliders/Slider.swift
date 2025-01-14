//
//  DoubleContinuousSlider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/14/25.
//


import SwiftUI

public struct Slider: View {
    public enum Count: Int {
        case single = 0
        case double = 1
    }
    // Slider value binding
    @Binding private var from: Double
    @Binding private var to: Double
    
    private let thumbCount: Slider.Count
    
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
    private let thumbHeight: CGFloat = 20
    private let trackHeight: CGFloat = 4
    
    public var body: some View {
        GeometryReader { geometry in
            let activeWidth: CGFloat = abs( CGFloat(to / range.upperBound) - CGFloat(from / range.upperBound) ) * geometry.size.width
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .fill(Color.SpenceKit.PrimaryForeground)
                    .frame(width: geometry.size.width, height: trackHeight)
                
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .fill(Color.SpenceKit.PrimaryAccent)
                    .offset(x: CGFloat((to - from > 0 ? from : to) / range.upperBound) * geometry.size.width)
                    .frame(width: max(activeWidth, 0), height: trackHeight)
                
                if thumbCount == .double {
                    thumbContentView($from, with: geometry)
                }
                thumbContentView($to, with: geometry)
            }
        }.frame(height: thumbHeight)
    }
    
    @ViewBuilder
    func thumbContentView(_ value: Binding<Double>, with geometry: GeometryProxy) -> some View {
        Circle()
            .stroke(Color.SpenceKit.Border, lineWidth: SpenceKit.Constants.borderWidth * 2)
            .frame(width: thumbHeight, height: thumbHeight)
            .background(Color.SpenceKit.Background)
            .offset(x: CGFloat(value.wrappedValue / range.upperBound) * geometry.size.width)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // Update slider value based on thumb's position
                        let newValue = min(max(0, gesture.location.x / geometry.size.width), 1) * (range.upperBound - range.lowerBound) + range.lowerBound
                        
                        withAnimation(.bouncy(duration: 0.22, extraBounce: 0.05)) {
                            value.wrappedValue = newValue
                        }
                    }
            )
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var from: Double = 0
    @Previewable @State var to: Double = 0.4
    Slider($from)
    Slider(from: $from, to: $to)
}
