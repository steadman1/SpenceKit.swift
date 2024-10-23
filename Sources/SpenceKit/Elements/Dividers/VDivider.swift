//
//  VDivider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct VDivider: View {
    public var body: some View {
        Rectangle()
            .frame(width: SpenceKit.Constants.borderWidth)
            .frame(maxHeight: .infinity)
            .foregroundStyle(Color.SpenceKit.Border)
    }
}


@available(iOS 16.0, *)
#Preview {
    VStack {
        VDivider()
    }
}

#endif
