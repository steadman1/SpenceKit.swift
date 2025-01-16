//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUICore)

import Foundation
import SwiftUICore

/// Universal enum determining either/both Color and functionality of SpenceKit Views
public enum SpenceKitStyle: Int {
    case CTA = 0
    case primary = 1
    case secondary = 2
    case tertiary = 3
    case lowest = 4
    case destructive = 5
}

/// Helps disamgiuate sizing for Icons and (possibly) other Views that use Font for sizing
public enum SpenceKitSize: Int {
    case large = 0
    case medium = 1
    case head = 2
    case subhead = 3
    case small = 4
    
    /// Contains functions to determine Icon sizing based on adjacent Text Fonts
    public struct Icon {
        /// Returns Font for each SpenceKitSize enum case
        public static func getFont(for size: SpenceKitSize) -> (font: Font, skeleton: Font.SpenceKit.FontSkeleton) {
            switch size {
            case .large:
                return (.SpenceKit.SansSecondaryTitleFont, .SansSecondaryTitle)
            case .medium:
                return (.SpenceKit.SansTertiaryTitleFont, .SansTertiaryTitle)
            case .head:
                return (.SpenceKit.SansHeadFont, .SansHead)
            case .subhead:
                return (.SpenceKit.SansSubheadFont, .SansSubhead)
            case .small:
                return (.SpenceKit.SansHintFont, .SansHint)
            }
        }
        
        /// Returns the recommended width and height in pts (pixels) for each SpenceKitSize enum case
        public static func getPixelSize(for size: SpenceKitSize) -> CGFloat {
            return getFont(for: size).skeleton.size * 1.25
        }
    }
}

#endif
