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
            fatalError("Failed to register font: \(reason)")
        }
    }

    public static let PPEditorialNew_LightItalic = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-UltralightItalic")
    public static let PPEditorialNew_RegularItalic = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-Italic")
    public static let PPEditorialNew_BoldItalic = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-UltraboldItalic")
    
    public static let PPEditorialNew_Light = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-Ultralight")
    public static let PPEditorialNew_Regular = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-Regular")
    public static let PPEditorialNew_Bold = SpenceKitFont(named: "PP Editorial New/PPEditorialNew-Ultrabold")
    
    
    public static let Inter = SpenceKitFont(named: "Inter")
    
    
    public static let TimesNewRomanCondensed = SpenceKitFont(named: "Times-New-Roman-Condensed")
}
