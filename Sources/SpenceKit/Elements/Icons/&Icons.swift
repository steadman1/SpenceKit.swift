//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/22/24.
//

import SwiftUI
import Foundation

// Static icon instances for quick access
public final class Icons {
    @MainActor @available(iOS 16.0, *)
    public static func Airplane(with size: SpenceKitSize) -> some View {
        Image(uiImage: UIImage(resource: .init(name: "Icons/Airplane", bundle: .module)))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: SpenceKitSize.Icon.getFont(for: size).skeleton.size * 1,
                   height: SpenceKitSize.Icon.getFont(for: size).skeleton.size * 1)
    }
    
    @MainActor @available(iOS 16.0, *)
    public static func MagnifyingGlass(with size: SpenceKitSize) -> some View {
        Image(uiImage: UIImage(resource: .init(name: "Icons/MagnifyingGlass", bundle: .module)))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: SpenceKitSize.Icon.getFont(for: size).skeleton.size * 1,
                   height: SpenceKitSize.Icon.getFont(for: size).skeleton.size * 1)
    }
}

@available(iOS 16.0, *)
#Preview {
    SFIcon("xmark", size: .head)
    Icons.Airplane(with: .head)
        .foregroundStyle(Color.SpenceKit.PrimaryText)
}
