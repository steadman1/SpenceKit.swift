//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/22/24.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 16.0, *)
public struct SearchBar<Content: View>: View {
    
    @Binding var query: String
    
    private let style: SpenceKitStyle
    private let placeholder: String
    private let label: Content
    private let hasLabel: Bool
    
    public init(
        _ query: Binding<String>,
        placeholder: String = "Search...",
        style: SpenceKitStyle = .CTA,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self._query = query
        self.style = style
        self.placeholder = placeholder
        self.label = label()
        self.hasLabel = style.rawValue <= 1
    }
    
    public init(
        _ query: Binding<String>,
        placeholder: String = "Search..."
    ) where Content == EmptyView {
        self._query = query
        self.style = .lowest
        self.placeholder = placeholder
        self.label = EmptyView()
        self.hasLabel = false
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .stroke(Color.SpenceKit.Border, lineWidth: SpenceKit.Constants.borderWidth)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .foregroundStyle(Color.SpenceKit.Background)
                    .background(Color.SpenceKit.Background)
                    .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
                
                HStack {
                    Icons.MagnifyingGlass(with: .large)
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                    
                    ZStack(alignment: .leading) {
                        if query.isEmpty {
                            Text("Search...")
                                .font(.SpenceKit.SansHeadFont)
                                .foregroundColor(Color.SpenceKit.TertiaryText)
                        }
                        TextField("", text: $query)
                            .font(.SpenceKit.SansHeadFont)
                    }
                    
                    HelperButtons.ClearText {
                        query = ""
                    }
                    
                    switch style {
                        case .CTA:
                            label
                        case .primary:
                            VDivider().padding(.vertical, SpenceKit.Constants.padding8)
                            ZStack {
                                label
                                    .padding(.leading, SpenceKit.Constants.padding4)
                                    .padding(.trailing, SpenceKit.Constants.padding12)
                            }.frame(minWidth: 24, minHeight: 24)
                        default:
                            EmptyView()
                    }
                }.padding(.leading, SpenceKit.Constants.padding16)
                    .padding(.trailing, hasLabel ? SpenceKit.Constants.padding8 : SpenceKit.Constants.padding16)
            }.frame(maxWidth: geometry.size.width,
                    maxHeight: 64)
        }
    }
}

#Preview {
    VStack {
        if #available(iOS 16.0, *) {
            SearchBar(.constant(""), style: .CTA) {
                IconButton {
                    
                } label: {
                    Icons.Airplane(with: .medium)
                }

            }
            SearchBar(.constant("Testing"), style: .primary) {
                IconButton(.lowest) {
                    
                } label: {
                    Icons.Airplane(with: .medium)
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                }
            }
            SearchBar(.constant("Testing"))
        }
    }
}

#endif
