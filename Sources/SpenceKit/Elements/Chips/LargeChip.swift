//
//  LargeChip.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct LargeChip<Content: View>: View {
    
    // Without action
    public init(
        _ style: SpenceKitStyle = .primary,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.style = style
        self.label = label()
        self.action = {}
        self.hasAction = false
        
        let colors = LargeChip.getColors(for: style)
        self.foreground = colors.foreground
        self.background = colors.background
        self.border = colors.border
    }
    
    // With action
    public init(
        _ style: SpenceKitStyle = .primary,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.style = style
        self.label = label()
        self.action = action
        self.hasAction = true
        
        let colors = LargeChip.getColors(for: style)
        self.foreground = colors.foreground
        self.background = colors.background
        self.border = colors.border
    }
    
    // With text without action
    public init(
        _ text: String,
        style: SpenceKitStyle = .primary
    ) where Content == Text {
        self.style = style
        self.label = LargeChip.getTextLabel(for: text, with: style)
        self.action = {}
        self.hasAction = false
        
        let colors = LargeChip.getColors(for: style)
        self.foreground = colors.foreground
        self.background = colors.background
        self.border = colors.border
    }
    
    // With text with action
    public init(
        _ text: String,
        style: SpenceKitStyle = .primary,
        action: @escaping () -> Void
    ) where Content == Text {
        self.style = style
        self.label = LargeChip.getTextLabel(for: text, with: style)
        self.action = action
        self.hasAction = true
        
        let colors = LargeChip.getColors(for: style)
        self.foreground = colors.foreground
        self.background = colors.background
        self.border = colors.border
    }
    
    private let style: SpenceKitStyle
    private let foreground: Color
    private let background: Color
    private let border: Color
    private let action: () -> Void
    private let hasAction: Bool
    private let label: Content
    
    public var body: some View {
        ZStack {
            Button(action: action) {
                if #available(iOS 17.0, *) {
                    label
                        .foregroundStyle(foreground)
                } else {
                    label
                        .foregroundColor(foreground)
                }
            }
            .padding(.horizontal, SpenceKit.Constants.padding16)
            .padding(.vertical, SpenceKit.Constants.padding12)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
            .stroke(color: border, width: SpenceKit.Constants.borderWidth)
            .disabled(!hasAction)
        }
    }
    
    private static func getTextLabel(for text: String, with style: SpenceKitStyle) -> Text {
        return Text(text)
            .font(.SpenceKit.SansHeadlineFont)
            .foregroundColor(LargeChip.getColors(for: style).foreground)
    }
    
    // Helper function to set colors based on priority
    private static func getColors(for style: SpenceKitStyle) -> (foreground: Color, background: Color, border: Color) {
        switch style {
            case .CTA:
                return (.SpenceKit.PrimaryCTA, .SpenceKit.SecondaryCTA, .SpenceKit.Clear)
            case .primary:
                return (.SpenceKit.PrimaryAccent, .SpenceKit.SecondaryAccent, .SpenceKit.Clear)
            case .secondary:
                return (.SpenceKit.PrimaryText, .SpenceKit.PrimaryForeground, .SpenceKit.Clear)
            case .tertiary:
                return (.SpenceKit.PrimaryText, .SpenceKit.Background, .SpenceKit.Border)
            default:
                return (.SpenceKit.PrimaryText, .SpenceKit.Clear, .SpenceKit.Clear)
        }
    }
}


@available(iOS 16.0, *)
#Preview {
    VStack {
        LargeChip("Test") {
            print()
        }
        ForEach(0..<5) { index in
            LargeChip(SpenceKitStyle(rawValue: index)!) {
                SFIcon("checkmark", size: .head)
                Text("Headline")
                    .font(Font.SpenceKit.SansHeadlineFont)
            }
        }
    }
}

#endif


