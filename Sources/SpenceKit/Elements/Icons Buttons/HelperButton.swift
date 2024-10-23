//
//  HelperButton.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct HelperButton<Content: View>: View {
    public init(
        _ style: SpenceKitStyle = .primary,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.style = style
        self.action = action
        self.label = label
        
        switch style {
            case .primary:
                self.foreground = .SpenceKit.TertiaryText
                self.background = .SpenceKit.PrimaryForeground
                self.border = .SpenceKit.Clear
            default:
                self.foreground = .SpenceKit.TertiaryText
                self.background = .SpenceKit.Background
                self.border = .SpenceKit.Border
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
        }.frame(width: 24 - (style == .tertiary ? SpenceKit.Constants.borderWidth : 0), height: 24 - (style == .tertiary ? SpenceKit.Constants.borderWidth : 0))
            .background(background)
            .clipShape(Circle())
            .stroke(color: border, width: SpenceKit.Constants.borderWidth)
    }
}

@available(iOS 16.0, *)
#Preview {
    HStack(alignment: .top) {
        // custom
        VStack {
            ForEach(1..<3) { index in
                HelperButton(SpenceKitStyle(rawValue: index)!) {
                    print()
                } label: {
                    SFIcon("checkmark", size: .small)
                }
            }
        }
        
        // statics
        VStack {
            HelperButtons.ClearText { }
            HelperButtons.Peek { }
            HelperButtons.Hide { }
            HelperButtons.Info { }
        }
    }
}

#endif
