//
//  CornerRadiusReader.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

#if canImport(SwiftUI)

import SwiftUI

#if os(macOS) && canImport(SwiftUICore)

import SwiftUICore

#endif

/// Defines CornerRadiusReader to read CGFloat value passed in from a parent View
public struct CornerRadiusReader<Content: View>: View {
    @Environment(\.cornerRadius) var cornerRadiusModel: CornerRadiusModel? // Optional

    let content: (CGFloat) -> Content

    public init(@ViewBuilder content: @escaping (CGFloat) -> Content) {
        self.content = content
    }

    public var body: some View {
        if let cornerRadiusModel = cornerRadiusModel {
            content(cornerRadiusModel.cornerRadius) // Pass the cornerRadius to the content if available
        } else {
            content(-1) // Default to -1 if no corner radius is available
        }
    }
}

#endif
