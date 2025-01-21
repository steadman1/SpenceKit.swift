//
//  Checkbox.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/26/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines Checkbox for binary input
@available(iOS 16.0, *)
public struct Checkbox: View {
    public enum State {
        case unchecked, checked, indeterminate
    }
    
    @Binding public var state: Checkbox.State
    
    private let foreground: Color
    private let background: Color
    private let border: Color
    
    public init(_ state: Binding<Checkbox.State>) {
        self._state = state
        
        let colors = Checkbox.getColors(for: state.wrappedValue)
        self.foreground = colors.foreground
        self.background = colors.background
        self.border = colors.border
    }
    
    public var body: some View {
        let isActive: Bool = state == .checked
        ZStack(alignment: isActive ? .trailing : .leading) {
            if (isActive) {
                SFIcon("checkmark", size: .subhead)
                    .foregroundStyle(foreground)
            } else if (state == .indeterminate) {
                SFIcon("minus", size: .subhead)
                    .foregroundStyle(foreground)
            }
        }.frame(width: 24, height: 24)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius8))
            .stroke(color: border, width: SpenceKit.Constants.borderWidth)
            .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius8 + SpenceKit.Constants.borderWidth))
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.22, extraBounce: 0.05)) {
                    state = state == .checked ? .unchecked : .checked
                }
            }
    }
    
    // Helper function to set colors based on priority
    private static func getColors(for state: Checkbox.State) -> (foreground: Color, background: Color, border: Color) {
        switch state {
        case .checked:
            return (.SpenceKit.PrimaryCTA, .SpenceKit.PrimaryAccent, .SpenceKit.Background)
        case .unchecked:
            return (.SpenceKit.Background, .SpenceKit.Background, .SpenceKit.Border)
        case .indeterminate:
            return (.SpenceKit.PrimaryAccent, .SpenceKit.SecondaryAccent, .SpenceKit.Background)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var state: Checkbox.State = .indeterminate
    Checkbox($state)
}

#endif

