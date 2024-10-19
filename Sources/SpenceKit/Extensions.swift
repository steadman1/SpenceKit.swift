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
        }
        
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
        
        // Custom fonts with specified sizes
        static let SansLargeTitleFont: Font = .custom(SansLargeTitle.name, size: SansLargeTitle.size).weight(.bold)
        static let SansPrimaryTitleFont: Font = .custom(SansPrimaryTitle.name, size: SansPrimaryTitle.size).weight(.bold)
        static let SansSecondaryTitleFont: Font = .custom(SansSecondaryTitle.name, size: SansSecondaryTitle.size).weight(.semibold)
        static let SansTertiaryTitleFont: Font = .custom(SansTertiaryTitle.name, size: SansTertiaryTitle.size).weight(.semibold)
        static let SansHeadlineFont: Font = .custom(SansHeadline.name, size: SansHeadline.size).weight(.bold)
        static let SansBodyFont: Font = .custom(SansBody.name, size: SansBody.size).weight(.medium)
        static let SansCalloutFont: Font = .custom(SansCallout.name, size: SansCallout.size).weight(.medium)
        static let SansSubheadlineFont: Font = .custom(SansSubheadline.name, size: SansSubheadline.size).weight(.semibold)
        static let SansCaptionFont: Font = .custom(SansCaption.name, size: SansCaption.size).weight(.medium)
        static let SansHintFont: Font = .custom(SansHint.name, size: SansHint.size).weight(.medium)
        
        static let SerifLargeTitleFont: Font = .custom(SerifLargeTitle.name, size: SerifLargeTitle.size)
        static let SerifTitleFont: Font = .custom(SerifTitle.name, size: SerifTitle.size)
        static let SerifSecondaryTitleFont: Font = .custom(SerifSecondaryTitle.name, size: SerifSecondaryTitle.size)
        static let SerifTertiaryTitleFont: Font = .custom(SerifTertiaryTitle.name, size: SerifTertiaryTitle.size)
        static let SerifBodyFont: Font = .custom(SerifBody.name, size: SerifBody.size)
        static let SerifCalloutFont: Font = .custom(SerifCallout.name, size: SerifCallout.size)
        static let SerifCaptionFont: Font = .custom(SerifCaption.name, size: SerifCaption.size)
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
