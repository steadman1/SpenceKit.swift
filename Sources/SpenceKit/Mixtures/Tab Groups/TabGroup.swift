//
//  TabGroup.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 1/11/25.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines TabGroup for vertically stacking tab selection
public struct TabGroup: View {
    private let title: String?
    private let tabs: [Tab]
    
    public init(title: String? = nil, tabs: [Tab]) {
        self.title = title
        self.tabs = tabs
    }
    
    public static let TAB_HEIGHT: CGFloat = 54
    
    public var body: some View {
        CornerRadiusReader { radius in
            let cornerRadius = radius > 0 ? radius : SpenceKit.Constants.cornerRadius24
            VStack(alignment: .leading) {
                if title != nil {
                    Text(title!)
                        .font(Font.SpenceKit.SansHintFont)
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                }
                VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing4) {
                    ForEach(tabs.enumerate(), id: \.0) { index, tab in
                        Button {
                            tab.action()
                        } label: {
                            HStack {
                                let padding = SpenceKit.Constants.padding16
                                ZStack {
                                    tab.activeIcon
                                        .font(Font.SpenceKit.SansHeadlineFont)
                                        .foregroundStyle(Color.SpenceKit.PrimaryAccent)
                                        .padding(padding)
                                }.frame(
                                    width: TabGroup.TAB_HEIGHT - padding,
                                    height: TabGroup.TAB_HEIGHT - padding
                                ).background(Color.SpenceKit.SecondaryAccent)
                                    .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24 - padding))
                                    
                                
                                Text(tab.title)
                                    .font(Font.SpenceKit.SansBodyFont)
                                    .foregroundStyle(Color.SpenceKit.PrimaryText)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(Font.SpenceKit.SansHeadlineFont)
                                    .foregroundStyle(Color.SpenceKit.TertiaryText)
                            }.frame(height: TabGroup.TAB_HEIGHT)
                        }
                        
                        if index < tabs.count - 1 {
                            Divider(.horizontal)
                        }
                    }
                }.frame(maxWidth: .infinity,
                           maxHeight: CGFloat(tabs.count) * TabGroup.TAB_HEIGHT + CGFloat(tabs.count) * SpenceKit.Constants.borderWidth + CGFloat(tabs.count * 2 - 1) * SpenceKit.Constants.spacing4)
                    .padding(.vertical, SpenceKit.Constants.padding4)
                    .padding(.horizontal, SpenceKit.Constants.padding16)
                    .background(Color.SpenceKit.Background)
                    .roundBorder(cornerRadius)
            }
        }
    }
}

#Preview {
    TabGroup(
        title: "General",
        tabs: [
            Tab(
                "Tab 1",
                icon: .init(systemName: "paintbrush")
               ),
            Tab(
                "Tab 2",
                icon: .init(systemName: "paintbrush")
               ),
            Tab(
                "Tab 3",
                icon: .init(systemName: "paintbrush")
               ),
        ]
    ).padding(.horizontal, 16)
    
    TabGroup(
        title: "Specific",
        tabs: [
            Tab(
                "Tab 1",
                icon: .init(systemName: "paintbrush")
               ),
            Tab(
                "Tab 2",
                icon: .init(systemName: "paintbrush")
               ),
            
        ]
    ).padding(.horizontal, 16)
}


#endif
