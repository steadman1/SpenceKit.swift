//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct IconButton: View {
    public var label: () -> Text
    public var action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            label()
        }
    }
}

#endif
