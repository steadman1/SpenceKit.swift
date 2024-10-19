//
//  Objects.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI

@available(iOS 13.0, *)
extension Font {
    public struct SpenceKit {
        public struct FontSkeleton: Sendable {
            let name: String
            let size: CGFloat
            
            // Define Font Attributes for Sans Typography
            static let SansLargeTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 88)
            static let SansPrimaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 64)
            static let SansSecondaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 58)
            static let SansTertiaryTitle: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 52)
            static let SansHeadline: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 40)
            static let SansBody: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 40)
            static let SansCallout: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 36)
            static let SansSubheadline: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 32)
            static let SansCaption: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 32)
            static let SansHint: FontSkeleton = .init(name: SpenceKitFont.Inter.name, size: 24)
            
            // Define Font Attributes for Serif Typography
            static let SerifLargeTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 88)
            static let SerifTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 64)
            static let SerifSecondaryTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 58)
            static let SerifTertiaryTitle: FontSkeleton = .init(name: SpenceKitFont.PPEditorialNew_Regular.name, size: 52)
            static let SerifBody: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 44)
            static let SerifCallout: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 40)
            static let SerifCaption: FontSkeleton = .init(name: SpenceKitFont.TimesNewRomanCondensed.name, size: 36)
        }
        
        // Custom fonts with specified sizes
        static let SansLargeTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansLargeTitle.name,
                                                      size: Font.SpenceKit.FontSkeleton.SansLargeTitle.size).weight(.bold)
        static let SansPrimaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansPrimaryTitle.name,
                                                        size: Font.SpenceKit.FontSkeleton.SansPrimaryTitle.size).weight(.bold)
        static let SansSecondaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansSecondaryTitle.name,
                                                          size: Font.SpenceKit.FontSkeleton.SansSecondaryTitle.size).weight(.semibold)
        static let SansTertiaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansTertiaryTitle.name,
                                                         size: Font.SpenceKit.FontSkeleton.SansTertiaryTitle.size).weight(.semibold)
        static let SansHeadlineFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansHeadline.name,
                                                    size: Font.SpenceKit.FontSkeleton.SansHeadline.size).weight(.bold)
        static let SansBodyFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansBody.name,
                                                size: Font.SpenceKit.FontSkeleton.SansBody.size).weight(.medium)
        static let SansCalloutFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansCallout.name,
                                                   size: Font.SpenceKit.FontSkeleton.SansCallout.size).weight(.medium)
        static let SansSubheadlineFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansSubheadline.name,
                                                       size: Font.SpenceKit.FontSkeleton.SansSubheadline.size).weight(.semibold)
        static let SansCaptionFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansCaption.name,
                                                   size: Font.SpenceKit.FontSkeleton.SansCaption.size).weight(.medium)
        static let SansHintFont: Font = .custom(Font.SpenceKit.FontSkeleton.SansHint.name,
                                                size: Font.SpenceKit.FontSkeleton.SansHint.size).weight(.medium)
        
        static let SerifLargeTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifLargeTitle.name,
                                                       size: Font.SpenceKit.FontSkeleton.SerifLargeTitle.size)
        static let SerifTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifTitle.name,
                                                  size: Font.SpenceKit.FontSkeleton.SerifTitle.size)
        static let SerifSecondaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.name,
                                                           size: Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.size)
        static let SerifTertiaryTitleFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.name,
                                                          size: Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.size)
        static let SerifBodyFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifBody.name,
                                                 size: Font.SpenceKit.FontSkeleton.SerifBody.size)
        static let SerifCalloutFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifCallout.name,
                                                    size: Font.SpenceKit.FontSkeleton.SerifCallout.size)
        static let SerifCaptionFont: Font = .custom(Font.SpenceKit.FontSkeleton.SerifCaption.name,
                                                    size: Font.SpenceKit.FontSkeleton.SerifCaption.size)
    }
}

@available(iOS 13.0, *)
extension Text {
    @MainActor func bold(font: Font.SpenceKit.FontSkeleton, strokeColor: Color = .black) -> some View {
        self
            .font(.custom(font.name, size: font.size))
            .overlay(
                self
                    .font(.custom(font.name, size: font.size))
                    .stroke(strokeColor, lineWidth: font.size / 10) // Adjust stroke width
            )
    }
}

@available(iOS 13.0, *)
extension View {
    func stroke(_ color: Color, lineWidth: CGFloat) -> some View {
        self.overlay(self.foregroundColor(color).scaleEffect(1 + lineWidth / 100))
    }
}
