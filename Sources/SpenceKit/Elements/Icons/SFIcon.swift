//
//  SFIcon.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

import SwiftUI

/// Defines SFIcon for consistent Image(systemName: "placeholder")
@available(iOS 16.0, *)
public struct SFIcon: View {
    public init (_ systemName: String, size: SpenceKitSize) {
        self.systemName = systemName
        self.size = size
    }
    
    private let systemName: String
    private let size: SpenceKitSize
    
    public var body: some View {
        Image(systemName: systemName)
            .font(.system(size: SpenceKitSize.Icon.getFont(for: size).skeleton.size * 0.8))
            .fontWeight(.black)
    }
}
