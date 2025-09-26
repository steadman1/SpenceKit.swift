//
//  SKSingleton.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import Foundation
import SwiftUI

#if os(macOS) && canImport(SwiftUICore)

import SwiftUICore

#endif

/// Contains SpenceKit related structures and objects
final public class SKSingleton: Sendable {
    public static let shared = SKSingleton()
    
    public let typography: Font.SpenceKit.TypographyTheme = .sansSerif
    
    private init() {}
}

#endif
