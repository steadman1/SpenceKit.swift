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
        _ priority: PriorityLevel = .primary,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.priority = priority
        self.action = action
        self.label = label
        
        switch priority {
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
    private let priority: PriorityLevel
    private let foreground: Color
    private let background: Color
    private let border: Color
    private let action: () -> Void
    private let label: () -> Content
    
    public var body: some View {
        Button(action: action) {
            ZStack {
                if #available(iOS 17.0, *) {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24)
                        .stroke(border, lineWidth: SpenceKit.Constants.borderWidth)
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .foregroundStyle(background)
                        .background(background)
                        .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24))
                    
                    label()
                        .foregroundStyle(foreground)
                } else {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24)
                        .stroke(border, lineWidth: SpenceKit.Constants.borderWidth)
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .foregroundColor(background)
                        .background(background)
                    
                    label()
                        .foregroundColor(foreground)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    VStack {
        ForEach(0..<5) { index in
            ExpandingButton(PriorityLevel(rawValue: index)!) {
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
