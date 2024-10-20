//
//  SpenceKitFont.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI

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

    public static let PPEditorialNew_LightItalic = SpenceKitFont(named: "PPEditorialNew-UltralightItalic")
    public static let PPEditorialNew_RegularItalic = SpenceKitFont(named: "PPEditorialNew-Italic")
    public static let PPEditorialNew_BoldItalic = SpenceKitFont(named: "PPEditorialNew-UltraboldItalic")
    
    public static let PPEditorialNew_Light = SpenceKitFont(named: "PPEditorialNew-Ultralight")
    public static let PPEditorialNew_Regular = SpenceKitFont(named: "PPEditorialNew-Regular")
    public static let PPEditorialNew_Bold = SpenceKitFont(named: "PPEditorialNew-Ultrabold")
    
    
    public static let Inter_Medium = SpenceKitFont(named: "Inter Medium")
    public static let Inter_Semibold = SpenceKitFont(named: "Inter Semibold")
    public static let Inter_Bold = SpenceKitFont(named: "Inter Bold")
    
    
    public static let TimesNewRomanCondensed = SpenceKitFont(named: "Times New Roman Condensed")
}
