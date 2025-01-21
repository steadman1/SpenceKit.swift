//
//  SpenceKit.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

#if canImport(CoreGraphics)

import CoreGraphics

/// Defines SpenceKit structures and objects
public struct SpenceKit {
    /// Defines integral constants for the SpenceKit design system
    public struct Constants {
        // corner radius
        public static let cornerRadiusMAX: CGFloat = 1024
        public static let cornerRadius32: CGFloat = 32
        public static let cornerRadius24: CGFloat = 24
        public static let cornerRadius16: CGFloat = 16
        public static let cornerRadius8: CGFloat = 8
        public static let cornerRadius4: CGFloat = 4
        
        // padding
        public static let padding24: CGFloat = 24
        public static let padding16: CGFloat = 16
        public static let padding12: CGFloat = 12
        public static let padding8: CGFloat = 8
        public static let padding4: CGFloat = 4
        
        // spacing
        public static let spacing24: CGFloat = 24
        public static let spacing16: CGFloat = 16
        public static let spacing12: CGFloat = 12
        public static let spacing8: CGFloat = 8
        public static let spacing4: CGFloat = 4
        
        public static let borderWidth: CGFloat = 2
    }
}

#endif
