//
//  Tab.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/29/24.
//


//
//  TabBarTab.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/27/24.
//

import SwiftUI

public struct Tab: Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let activeIcon: Image
    public let inactiveIcon: Image
    public let action: () -> Void
    
    public init(
        title: String,
        icon: Image,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.activeIcon = icon
        self.inactiveIcon = icon
        self.action = action
    }
    
    public init(
        title: String,
        icon: Image
    ) {
        self.title = title
        self.activeIcon = icon
        self.inactiveIcon = icon
        self.action = { }
    }
    
    public init(
        title: String,
        activeIcon: Image,
        inactiveIcon: Image,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
        self.action = action
    }
    
    public init(
        title: String,
        activeIcon: Image,
        inactiveIcon: Image
    ) {
        self.title = title
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
        self.action = { }
    }
}
