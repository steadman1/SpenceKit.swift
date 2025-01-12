//
//  HDivider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct Divider: View {
    
    private let axis: Axis
    
    public init(_ axis: Axis) {
        self.axis = axis
    }
    
    public var body: some View {
        switch axis {
        case .horizontal:
            Rectangle()
                .frame(height: SpenceKit.Constants.borderWidth)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.SpenceKit.Border)
        case .vertical:
            Rectangle()
                .frame(width: SpenceKit.Constants.borderWidth)
                .frame(maxHeight: .infinity)
                .foregroundStyle(Color.SpenceKit.Border)
        }
    }
}


@available(iOS 16.0, *)
#Preview {
    VStack {
        Divider(.vertical)
    }
}

#endif
