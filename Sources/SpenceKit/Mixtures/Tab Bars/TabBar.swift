//
//  TabBar.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 12/27/24.
//

#if canImport(SwiftUI)

import SwiftUI
import ViewExtractor
import MeasurementReader

@available(iOS 16.0, *)
public struct TabBar<ContentInactive: View, ContentActive: View>: View {
    
    @Binding var selection: Int

    private let contentInactive: ContentInactive
    private let contentActive: ContentActive
    
    public init(
        _ selection: Binding<Int>,
        @ViewBuilder active: @escaping () -> ContentActive,
        @ViewBuilder inactive: @escaping () -> ContentInactive
    ) {
        self._selection = selection
        self.contentInactive = inactive()
        self.contentActive = active()
    }
    
    public var body: some View {
        HStack {
            HStack {
                Extract(contentActive) { active in
                    Extract(contentInactive) { inactive in
                        let inactive_active = Array(zip(active, inactive))
                        let indexed = Array(zip(active.indices, inactive_active))
                        HStack {
                            ForEach(indexed, id: \.0) { index, views in
                                if index == selection {
                                    ZStack {
                                        views.0
                                    }.padding(SpenceKit.Constants.padding12)
                                        .background(Color.SpenceKit.Background)
                                        .clipShape(
                                            RoundedRectangle(
                                                cornerRadius: SpenceKit.Constants.cornerRadius16
                                            )
                                        )
                                } else {
                                    views.1
                                        .padding(SpenceKit.Constants.padding12)
                                        .onTapGesture {
                                            selection = index
                                        }
                                }
                                
                                if index < indexed.count - 1 {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }.frame(maxWidth: .infinity)
            .padding(.horizontal, SpenceKit.Constants.padding16)
            .padding(.top, SpenceKit.Constants.padding12)
            .background(Color.SpenceKit.PrimaryForeground)
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selectedTab: Int = 0
    
    VStack {
        Spacer()
        TabBar($selectedTab) {
            TabBarTab(title: "Home", icon: .init(systemName: "house.fill"))
            TabBarTab(title: "Search", icon: .init(systemName: "magnifyingglass.circle.fill"))
        } inactive: {
            TabBarTab(title: "Home", icon: .init(systemName: "house"))
            TabBarTab(title: "Search", icon: .init(systemName: "magnifyingglass.circle"))
        }
    }
}

#endif
