//
//  ExpandingButton.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/20/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct ExpandingButton<Content: View>: View {
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
        CornerRadiusReader { radius in
            let cornerRadius = radius > 0 ? radius : SpenceKit.Constants.cornerRadius24
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(border, lineWidth: SpenceKit.Constants.borderWidth * 2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .foregroundStyle(background)
                    .background(background)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                
                Button(action: action) {
                    if #available(iOS 17.0, *) {
                        label()
                            .frame(maxWidth: .infinity)
                            .frame(height: 64)
                            .foregroundStyle(foreground)
                    } else {
                        label()
                            .frame(maxWidth: .infinity)
                            .frame(height: 64)
                            .foregroundColor(foreground)
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    VStack {
        ForEach(0..<5) { index in
            ExpandingButton(SpenceKitStyle(rawValue: index)!) {
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

