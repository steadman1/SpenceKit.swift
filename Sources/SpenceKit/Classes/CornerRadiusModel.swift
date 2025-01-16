//
//  CornerRadiusModel.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/16/25.
//

import Foundation

/// Defines an ObservableObject to hold the corner radius value
public class CornerRadiusModel: ObservableObject {
    @Published var cornerRadius: CGFloat = -1
    
    init(_ cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
}
