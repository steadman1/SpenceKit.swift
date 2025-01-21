//
//  Dropdown.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines Dropdown for tab selection input
@available(iOS 16.0, *)
public struct Dropdown: View {
    @Binding public var selection: Int
    
    public init(_ selection: Binding<Int>, placeholder: String = "Select...", tabs: [Tab]) {
        self._selection = selection
        self.placeholder = placeholder
        self.tabs = tabs
    }
    
    private let placeholder: String
    private let tabs: [Tab]
    
    public var body: some View {
        let height = "|".stringSize(usingFont: UIFont.SpenceKit.SansBodyFont).height + SpenceKit.Constants.padding12 * 2
        GeometryReader { geometry in
            Menu {
                Picker("", selection: $selection) {
                    ForEach(tabs.enumerate(), id: \.0) { index, tab in
                        Button(tab.title, role: tab.role) {
                            selection = index
                        }
                    }
                }
            } label: {
                HStack {
                    Text(selection < 0 ? placeholder : tabs[selection].title)
                        .font(Font.SpenceKit.HeadlineFont)
                        .foregroundStyle(
                            selection < 0
                                ? Color.SpenceKit.SecondaryText
                                : Color.SpenceKit.PrimaryText
                        )
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.SpenceKit.SecondaryText)
                        .fontWeight(.bold)
                }.padding(.horizontal, SpenceKit.Constants.padding16)
                    .frame(
                        width: geometry.size.width,
                        height: height
                    )
            }.menuIndicator(.hidden)
                .frame(
                    width: geometry.size.width,
                    height: height
                ).roundBorder(SpenceKit.Constants.cornerRadiusMAX)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selection = -1
    Dropdown(
        $selection,
        tabs: [
            Tab("Test 1"),
            Tab("Test 2"),
            Tab("Test 3")
        ]
    )
}

#endif


