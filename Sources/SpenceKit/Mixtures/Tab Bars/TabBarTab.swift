//
//  TabBarTab.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/27/24.
//

import SwiftUI

public struct TabBarTab: View {
    public let title: String
    public let icon: Image
    
    public var body: some View {
        VStack {
            icon
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color.SpenceKit.PrimaryText)
            Text(title)
                .font(Font.SpenceKit.SansHintFont)
        }
    }
}
