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
        HelperButton<AnyView>(.primary) {} label: {
            AnyView(
                SFIcon("xmark", size: .head)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Peek(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {} label: {
            AnyView(
                SFIcon("eye", size: .head)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Hide(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {} label: {
            AnyView(
                SFIcon("eye.slash", size: .head)
            )
        }
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func Info(action: @escaping () -> Void) -> some View {
        HelperButton<AnyView>(.lowest) {} label: {
            AnyView(
                SFIcon("info", size: .head)
            )
        }
    }
}
