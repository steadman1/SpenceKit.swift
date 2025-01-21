//
//  SKSingleton.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUICore)

import Foundation
import SwiftUICore

/// Contains SpenceKit related structures and objects
final public class SKSingleton: Sendable {
    public static let shared = SKSingleton()
    
    public let typography: Font.SpenceKit.TypographyTheme = .sansSerif
    
    private init() {}
}

#endif
