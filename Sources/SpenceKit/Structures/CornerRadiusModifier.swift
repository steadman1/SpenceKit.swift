//
//  CornerRadiusModifier.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

import SwiftUICore

/// Defines CornerRadiusModifier to inject the corner radius into the environment
public struct CornerRadiusModifier: ViewModifier {
    @ObservedObject var cornerRadius: CornerRadiusModel
    
    public func body(content: Content) -> some View {
        content
            .environment(\.cornerRadius, cornerRadius)
    }
}

