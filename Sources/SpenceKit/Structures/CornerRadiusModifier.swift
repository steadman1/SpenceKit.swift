//
//  CornerRadiusModifier.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

#if canImport(SwiftUI)

import SwiftUI

#if os(macOS) && canImport(SwiftUICore)

import SwiftUICore

#endif

/// Defines CornerRadiusModifier to inject the corner radius into the environment
public struct CornerRadiusModifier: ViewModifier {
    @ObservedObject var cornerRadius: CornerRadiusModel
    
    public func body(content: Content) -> some View {
        content
            .environment(\.cornerRadius, cornerRadius)
    }
}

#endif
