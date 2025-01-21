//
//  Radio.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/28/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines Radio for binary selection
@available(iOS 16.0, *)
public struct Radio: View {
    @Binding public var isActive: Bool
    
    public init(_ isActive: Binding<Bool>) {
        self._isActive = isActive
    }
    
    let ACTIVE_BORDER_WIDTH: CGFloat = 6
    
    public var body: some View {
        Circle()
            .stroke(
                isActive ? Color.SpenceKit.PrimaryAccent : Color.SpenceKit.Border,
                lineWidth: isActive ? ACTIVE_BORDER_WIDTH : SpenceKit.Constants.borderWidth
            )
            .frame(
                width: 24 - (isActive ? ACTIVE_BORDER_WIDTH : SpenceKit.Constants.borderWidth),
                height: 24 - (isActive ? ACTIVE_BORDER_WIDTH : SpenceKit.Constants.borderWidth)
            )
            .background(Color.SpenceKit.Background)
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.22, extraBounce: 0.05)) {
                    isActive.toggle()
                }
            }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var state = true
    Radio($state)
}

#endif


