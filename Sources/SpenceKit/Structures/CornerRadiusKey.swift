//
//  CornerRadiusKey.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

import SwiftUICore

/// Defines an EnvironmentKey for optional CornerRadiusModel
public struct CornerRadiusKey: @preconcurrency EnvironmentKey {
    @MainActor public static let defaultValue: CornerRadiusModel? = nil
}
