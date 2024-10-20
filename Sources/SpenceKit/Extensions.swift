//
//  Objects.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI
import UIKit

extension Color {
    public struct SpenceKit {
        public static let Border = Color(UIColor(resource: .init(name: "Colors/Border", bundle: .module)))
        public static let Clear = Color(UIColor(resource: .init(name: "Colors/Clear", bundle: .module)))
        
        // Accents
        public static let PrimaryAccent = Color(UIColor(resource: .init(name: "Colors/Accent/PrimaryAccent", bundle: .module)))
        public static let SecondaryAccent = Color(UIColor(resource: .init(name: "Colors/Accent/SecondaryAccent", bundle: .module)))
        
        // CTA
        public static let PrimaryCTA = Color(UIColor(resource: .init(name: "Colors/CTA/PrimaryCTA", bundle: .module)))
        public static let SecondaryCTA = Color(UIColor(resource: .init(name: "Colors/CTA/SecondaryCTA", bundle: .module)))
        
        // Grounding
        public static let Background = Color(UIColor(resource: .init(name: "Colors/Ground/Background", bundle: .module)))
        public static let PrimaryForeground = Color(UIColor(resource: .init(name: "Colors/Ground/PrimaryForeground", bundle: .module)))
        public static let LayerForeground = Color(UIColor(resource: .init(name: "Colors/Ground/LayerForeground", bundle: .module)))
        
        // Text
        public static let PrimaryText = Color(UIColor(resource: .init(name: "Colors/Text/PrimaryText", bundle: .module)))
        public static let SecondaryText = Color(UIColor(resource: .init(name: "Colors/Text/SecondaryText", bundle: .module)))
        public static let TertiaryText = Color(UIColor(resource: .init(name: "Colors/Text/TertiaryText", bundle: .module)))
    }
}

extension Font {
    public struct SpenceKit {
        public struct FontSkeleton: Sendable {
            public let name: String
            public let size: CGFloat
            
            // Define Font Attributes for Sans Typography
            public static let SansLargeTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 34)
            public static let SansPrimaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 28)
            public static let SansSecondaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 22)
            public static let SansTertiaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 20)
            public static let SansHeadline: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 17)
            public static let SansBody: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 17)
            public static let SansCallout: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 16)
            public static let SansSubheadline: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 15)
            public static let SansCaption: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 15)
            public static let SansHint: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 13)
            
            // Define Font Attributes for Serif Typography
            public static let SerifLargeTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 36)
            public static let SerifPrimaryTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 30)
            public static let SerifSecondaryTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 24)
            public static let SerifTertiaryTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_RegularItalic.name, size: 22)
            public static let SerifBody: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 18)
            public static let SerifCallout: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 17)
            public static let SerifCaption: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 16)
        }
        
        // Custom fonts with specified sizes
        public static let SansLargeTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansLargeTitle.name,
                                                      size: Font.SpenceKit.FontSkeleton.SansLargeTitle.size).weight(.bold)
        public static let SansPrimaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansPrimaryTitle.name,
                                                        size: Font.SpenceKit.FontSkeleton.SansPrimaryTitle.size).weight(.bold)
        public static let SansSecondaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansSecondaryTitle.name,
                                                          size: Font.SpenceKit.FontSkeleton.SansSecondaryTitle.size).weight(.semibold)
        public static let SansTertiaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansTertiaryTitle.name,
                                                         size: Font.SpenceKit.FontSkeleton.SansTertiaryTitle.size).weight(.semibold)
        public static let SansHeadlineFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansHeadline.name,
                                                    size: Font.SpenceKit.FontSkeleton.SansHeadline.size).weight(.bold)
        public static let SansBodyFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansBody.name,
                                                size: Font.SpenceKit.FontSkeleton.SansBody.size).weight(.medium)
        public static let SansCalloutFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansCallout.name,
                                                   size: Font.SpenceKit.FontSkeleton.SansCallout.size).weight(.medium)
        public static let SansSubheadlineFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansSubheadline.name,
                                                       size: Font.SpenceKit.FontSkeleton.SansSubheadline.size).weight(.semibold)
        public static let SansCaptionFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansCaption.name,
                                                   size: Font.SpenceKit.FontSkeleton.SansCaption.size).weight(.medium)
        public static let SansHintFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansHint.name,
                                                size: Font.SpenceKit.FontSkeleton.SansHint.size).weight(.medium)
        
        public static let SerifLargeTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifLargeTitle.name,
                                                       size: Font.SpenceKit.FontSkeleton.SerifLargeTitle.size)
        public static let SerifPrimaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifPrimaryTitle.name,
                                                  size: Font.SpenceKit.FontSkeleton.SerifPrimaryTitle.size)
        public static let SerifSecondaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.name,
                                                           size: Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.size)
        public static let SerifTertiaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.name,
                                                          size: Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.size)
        public static let SerifBodyFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifBody.name,
                                                 size: Font.SpenceKit.FontSkeleton.SerifBody.size)
        public static let SerifCalloutFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifCallout.name,
                                                    size: Font.SpenceKit.FontSkeleton.SerifCallout.size)
        public static let SerifCaptionFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifCaption.name,
                                                    size: Font.SpenceKit.FontSkeleton.SerifCaption.size)
    }
}

public extension View {
    @MainActor func serifBold(font: Font.SpenceKit.FontSkeleton, strokeColor: Color = .black) -> some View {
        self
            .font(.custom(font.name, size: font.size))
            .stroke(color: strokeColor, width: font.size / 80)
    }
    
    @MainActor func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width / 2, strokeColor: color))
    }
}

// from "paescebu" on StackOverflow
// https://stackoverflow.com/questions/57334125/how-to-make-text-stroke-in-swiftui
public struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue

    public func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }

    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }

    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}
