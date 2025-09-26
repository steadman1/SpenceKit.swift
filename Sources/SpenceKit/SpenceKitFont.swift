//
//  SpenceKitFont.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Creates Fonts for registration using .xcasset name
public struct SpenceKitFont: Sendable {

    public let name: String

    private init(named name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            let reason = error.localizedDescription
            fatalError("Failed to register font \"\(name)\": \(reason)")
        }
    }

    public static let LibreCaslon_RegularItalic = SpenceKitFont(named: "LibreCaslonCondensed-RegularItalic")
    public static let LibreCaslon_MediumItalic = SpenceKitFont(named: "LibreCaslonCondensed-MediumItalic")
    public static let LibreCaslon_BoldItalic = SpenceKitFont(named: "LibreCaslonCondensed-BoldItalic")
    
    public static let LibreCaslon_Regular = SpenceKitFont(named: "LibreCaslonCondensed-Regular")
    public static let LibreCaslon_Medium = SpenceKitFont(named: "LibreCaslonCondensed-Medium")
    public static let LibreCaslon_Bold = SpenceKitFont(named: "LibreCaslonCondensed-Bold")
    
    
    public static let Inter_Medium = SpenceKitFont(named: "Inter-Medium")
    public static let Inter_Semibold = SpenceKitFont(named: "Inter-Semibold")
    public static let Inter_Bold = SpenceKitFont(named: "Inter-Bold")
}

#endif
