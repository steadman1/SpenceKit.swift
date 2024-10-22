//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct IconButton<Content: View>: View {
    public init(
        _ style: SpenceKitStyle = .primary,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.style = style
        self.action = action
        self.label = label
        
        switch style {
        case .CTA:
            self.foreground = .SpenceKit.PrimaryCTA
            self.background = .SpenceKit.SecondaryCTA
            self.border = .SpenceKit.Clear
        case .primary:
            self.foreground = .SpenceKit.PrimaryAccent
            self.background = .SpenceKit.SecondaryAccent
            self.border = .SpenceKit.Clear
        case .secondary:
            self.foreground = .SpenceKit.PrimaryText
            self.background = .SpenceKit.PrimaryForeground
            self.border = .SpenceKit.Clear
        case .tertiary:
            self.foreground = .SpenceKit.PrimaryText
            self.background = .SpenceKit.Background
            self.border = .SpenceKit.Border
        default:
            self.foreground = .SpenceKit.PrimaryText
            self.background = .SpenceKit.Clear
            self.border = .SpenceKit.Clear
        }
    }
    private let style: SpenceKitStyle
    private let foreground: Color
    private let background: Color
    private let border: Color
    private let action: () -> Void
    private let label: () -> Content
    
    public var body: some View {
        Button(action: action) {
            if #available(iOS 17.0, *) {
                label()
                    .foregroundStyle(foreground)
            } else {
                label()
                    .foregroundColor(foreground)
            }
        }.frame(width: 48 - (style == .tertiary ? SpenceKit.Constants.borderWidth : 0), height: 48 - (style == .tertiary ? SpenceKit.Constants.borderWidth : 0))
            .background(background)
            .clipShape(Circle())
            .stroke(color: border, width: SpenceKit.Constants.borderWidth)
    }
}

@available(iOS 16.0, *)
#Preview {
    VStack {
        ForEach(0..<5) { index in
            IconButton(SpenceKitStyle(rawValue: index)!) {
                print()
            } label: {
                Text("hello")
                    .font(Font.SpenceKit.SansHeadlineFont)
//                Image(systemName: "arrow.up.right")
//                    .fontWeight(.black)
            }
        }
    }
}

#endif
