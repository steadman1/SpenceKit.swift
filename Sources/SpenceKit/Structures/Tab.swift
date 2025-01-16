//
//  Tab.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/29/24.
//


#if canImport(SwiftUI)

import SwiftUI

/// Defines Tab as a Universal String, Image, and Action structure
public struct Tab: Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let hasIcon: Bool
    public let activeIcon: Image
    public let inactiveIcon: Image
    public let role: ButtonRole?
    public let action: () -> Void
    
    public init(
        _ title: String,
        icon: Image,
        role: ButtonRole? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.hasIcon = true
        self.activeIcon = icon
        self.inactiveIcon = icon
        self.role = role
        self.action = action
    }
    
    public init(
        _ title: String,
        icon: Image,
        role: ButtonRole? = nil
    ) {
        self.title = title
        self.hasIcon = true
        self.activeIcon = icon
        self.inactiveIcon = icon
        self.role = role
        self.action = { }
    }
    
    public init(
        _ title: String,
        activeIcon: Image,
        inactiveIcon: Image,
        role: ButtonRole? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.hasIcon = true
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
        self.role = role
        self.action = action
    }
    
    public init(
        _ title: String,
        activeIcon: Image,
        inactiveIcon: Image,
        role: ButtonRole? = nil
    ) {
        self.title = title
        self.hasIcon = true
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
        self.role = role
        self.action = { }
    }
    
    public init(
        _ title: String,
        role: ButtonRole? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.hasIcon = false
        self.activeIcon = Image("")
        self.inactiveIcon = Image("")
        self.role = role
        self.action = action
    }
    
    public init(
        _ title: String,
        role: ButtonRole? = nil
    ) {
        self.title = title
        self.hasIcon = false
        self.activeIcon = Image("")
        self.inactiveIcon = Image("")
        self.role = role
        self.action = { }
    }
}

#endif
