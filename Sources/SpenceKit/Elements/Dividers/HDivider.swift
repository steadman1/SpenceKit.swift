//
//  HDivider.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

public struct HDivider: View {
    public var body: some View {
        Rectangle()
            .frame(height: SpenceKit.Constants.borderWidth)
            .foregroundStyle(Color.SpenceKit.Border)
    }
}


@available(iOS 16.0, *)
#Preview {
    VStack {
        HDivider()
    }
}

#endif
