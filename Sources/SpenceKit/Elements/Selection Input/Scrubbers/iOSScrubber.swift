//
//  iOSScrubber.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/14/25.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines a custom implementation of iOS 17's media scrubber slider
public struct iOSScrubber: View {
    public enum ScrubberBinding {
        case bindAlways
        case bindAtRest
    }
    
    // Slider value binding
    @Binding private var value: CGFloat
    @State private var animating: CGFloat
    
    public init(
        _ value: Binding<CGFloat>,
        bind: ScrubberBinding = .bindAlways
    ) {
        self._value = value
        self._animating = State(initialValue: value.wrappedValue)
        self.bindingType = bind
    }
    
    @State private var isDragging: Bool = false
    @State private var previousTranlationX: CGFloat = 0
    @State private var velocityX: CGFloat = 0
    @State private var timer: Timer? = nil
    
    private let bindingType: ScrubberBinding
    
    private let draggingTrackHeight: CGFloat = 14
    private let defaultTrackHeight: CGFloat = 10
    
    public var body: some View {
        GeometryReader { geometry in
            let activeWidth: CGFloat = animating * geometry.size.width
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.SpenceKit.ModeInverseAccent)
                        .blendMode(.softLight)
                        .opacity(0.65)
                        .frame(
                            width: geometry.size.width,
                            height: isDragging ? draggingTrackHeight : defaultTrackHeight
                        )
                    Rectangle()
                        .foregroundColor(Color.SpenceKit.ModeInverseAccent)
                        .opacity(0.25)
                        .blendMode(.lighten)
                        .frame(
                            width: geometry.size.width,
                            height: isDragging ? draggingTrackHeight : defaultTrackHeight
                        )
                    Rectangle()
                        .fill(Color.SpenceKit.ModeInverseAccent)
                        .blendMode(.softLight)
                        .opacity(0.9)
                        .frame(
                            width: activeWidth,
                            height: isDragging ? draggingTrackHeight : defaultTrackHeight
                        )
                    Rectangle()
                        .foregroundColor(Color.SpenceKit.ModeInverseAccent)
                        .opacity(isDragging ? 1 : 0.4)
                        .frame(
                            width: activeWidth,
                            height: isDragging ? draggingTrackHeight : defaultTrackHeight
                        )
                }
                .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { gesture in
                                withAnimation(.SpenceKit.Bouncy.normal) {
                                    isDragging = false
                                }
                                previousTranlationX = 0
                                startGlideIfNeeded()
                            }
                            .onChanged { gesture in
                                withAnimation(.SpenceKit.Bouncy.normal) {
                                    isDragging = true
                                }
                                velocityX = gesture.velocity.width
                                let newValue = (gesture.translation.width - previousTranlationX) / geometry.size.width
                                
                                withAnimation(.SpenceKit.Bouncy.quick) {
                                    animating = min(max(0, animating + newValue), 1)
                                    if bindingType == .bindAlways { value = animating }
                                }
                                previousTranlationX = gesture.translation.width
                            }
                    )
            }.frame(height: draggingTrackHeight)
        }.frame(height: draggingTrackHeight)
            .onChange(of: value) { newValue in
                if animating != newValue { animating = newValue }
            }
    }
    
    private func startGlideIfNeeded() {
        guard abs(velocityX) > 50 else { value = animating; return }

        timer?.invalidate() // Ensure there's no existing timer running
        timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            DispatchQueue.main.async {
                if abs(velocityX) < 4 { // Stop if velocity is too small
                    self.timer?.invalidate()
                    self.timer = nil
                    value = animating
                    return
                }

                // Reduce velocity and update position
                velocityX *= 0.85
                let delta = (velocityX) / 12000 // Adjust factor as needed
                animating = min(max(0, animating + delta), 1) // Keep within 0 to 1 range

                // Ensure UI updates smoothly
                withAnimation(.SpenceKit.Bouncy.slow) {
                    if bindingType == .bindAlways { value = animating }
                    animating = animating
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var value: CGFloat = 0.4
    VStack {
        iOSScrubber($value)
    }.frame(width: 300, height: 200)
        .padding(.horizontal, SpenceKit.Constants.padding24)
        .background(Color(red: 190/255, green: 166/255, blue: 248/255))
        .colorScheme(.light)
    VStack {
        iOSScrubber($value, bind: .bindAtRest)
    }.frame(width: 300, height: 200)
        .padding(.horizontal, SpenceKit.Constants.padding24)
        .background(Color(red: 65/255, green: 46/255, blue: 156/255))
        .colorScheme(.dark)
    
    VStack {
        iOSScrubber($value, bind: .bindAtRest)
    }.frame(width: 300, height: 300)
        .padding(.horizontal, SpenceKit.Constants.padding24)
        .background(.black)
        .colorScheme(.dark)
}

#endif
