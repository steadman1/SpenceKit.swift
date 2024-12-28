//
//  TabBarTab.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/27/24.
//

import SwiftUI

public struct TabBarTab: View {
    private let title: String
    private let icon: Image
    
    public init(
        title: String,
        icon: Image
    ) {
        self.title = title
        self.icon = icon
    }
    
    public var body: some View {
        VStack {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 24, maxHeight: 24)
                .foregroundStyle(Color.SpenceKit.PrimaryText)
            Text(title)
                .font(Font.SpenceKit.SansHintFont)
        }
    }
}
