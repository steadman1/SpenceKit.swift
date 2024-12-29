//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import Foundation
import SwiftUICore

public enum SpenceKitStyle: Int {
    case CTA = 0
    case primary = 1
    case secondary = 2
    case tertiary = 3
    case lowest = 4
    case destructive = 5
}

public enum SpenceKitSize: Int {
    case large = 0
    case medium = 1
    case head = 2
    case subhead = 3
    case small = 4
    
    public struct Icon {
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
        
        public static func getPixelSize(for size: SpenceKitSize) -> CGFloat {
            return getFont(for: size).skeleton.size * 1.25
        }
    }
}
