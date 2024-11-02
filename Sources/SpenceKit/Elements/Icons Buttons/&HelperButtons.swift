//
//  &HelperButtons.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

import SwiftUI
import Foundation

// Static helper buttons instances for quick access
public final class HelperButtons {
    @MainActor @available(iOS 16.0, *)
    public static func ClearText(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.primary) {
            action()
        } label: {
            AnyView(
                SFIcon("xmark", size: .small)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Peek(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {
            action()
        } label: {
            AnyView(
                SFIcon("eye", size: .small)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Hide(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {
            action()
        } label: {
            AnyView(
                SFIcon("eye.slash", size: .small)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Info(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {
            action()
        } label: {
            AnyView(
                SFIcon("info", size: .head)
            )
        }
    }
}
