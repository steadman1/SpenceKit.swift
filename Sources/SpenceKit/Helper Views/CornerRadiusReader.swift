//
//  CornerRadiusReader.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

// ObservableObject to hold the corner radius value
class CornerRadiusModel: ObservableObject {
    @Published var cornerRadius: CGFloat = -1
    
    init(_ cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
}

// Define an EnvironmentKey for optional CornerRadiusModel
struct CornerRadiusKey: @preconcurrency EnvironmentKey {
    @MainActor static let defaultValue: CornerRadiusModel? = nil
}

extension EnvironmentValues {
    var cornerRadius: CornerRadiusModel? {
        get { self[CornerRadiusKey.self] }
        set { self[CornerRadiusKey.self] = newValue }
    }
}

// Extend View to apply cornerRadius to the environment
extension View {
    func cornerRadius(_ cornerRadius: CGFloat) -> some View {
        self.environment(\.cornerRadius, CornerRadiusModel(cornerRadius))
            .modifier(CornerRadiusModifier(cornerRadius: CornerRadiusModel(cornerRadius)))
    }
}

// Modifier to inject the corner radius into the environment
struct CornerRadiusModifier: ViewModifier {
    @ObservedObject var cornerRadius: CornerRadiusModel
    
    func body(content: Content) -> some View {
        content
            .environment(\.cornerRadius, cornerRadius)
    }
}

// CornerRadiusReader Struct
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
            content(-1) // Default to 0 if no corner radius is available
        }
    }
}

#endif
