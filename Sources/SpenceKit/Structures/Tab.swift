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

public struct Tab {
    public let title: String
    public let activeIcon: Image
    public let inactiveIcon: Image
    
    public init(
        title: String,
        icon: Image
    ) {
        self.title = title
        self.activeIcon = icon
        self.inactiveIcon = icon
    }
    
    public init(
        title: String,
        activeIcon: Image,
        inactiveIcon: Image
    ) {
        self.title = title
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
    }
}
