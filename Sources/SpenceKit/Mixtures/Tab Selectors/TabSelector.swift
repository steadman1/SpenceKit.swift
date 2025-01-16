//
//  TabSelector.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/23/24.
//

#if canImport(SwiftUI)

import SwiftUI
import ViewExtractor
import MeasurementReader

/// Defines TabSelector for Inline tab selection
@available(iOS 16.0, *)
public struct TabSelector<ContentInactive: View, ContentActive: View>: View {
    
    @Binding var selection: Int
    
    private let style: SpenceKitStyle
    private let contentInactive: ContentInactive
    private let contentActive: ContentActive
    
    public init(
        _ selection: Binding<Int>,
        style: SpenceKitStyle,
        tabs: [Tab]
    ) where ContentInactive == AnyView, ContentActive == AnyView {
        self._selection = selection
        self.style = style
        self.contentInactive = {
            AnyView(
                ForEach(tabs.map { $0.title }, id: \.self) { name in
                    SmallChip(name, style: .lowest)
                }
            )
        }() as ContentInactive
        self.contentActive = {
            AnyView(
                ForEach(tabs.map { $0.title }, id: \.self) { name in
                    SmallChip(name, style: style)
                }
            )
        }() as ContentActive
    }
    
    public init(
        _ selection: Binding<Int>,
        @ViewBuilder active: @escaping () -> ContentActive,
        @ViewBuilder inactive: @escaping () -> ContentInactive
    ) {
        self._selection = selection
        self.style = .lowest
        self.contentInactive = inactive()
        self.contentActive = active()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            MeasurementReader<Any, Untagged> { proxy in
                ZStack {
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .stroke(Color.SpenceKit.Border, lineWidth: SpenceKit.Constants.borderWidth * 2)
                        .frame(maxWidth: .infinity)
                        .frame(height: proxy.maxHeight())
                        .foregroundStyle(Color.SpenceKit.Background)
                        .background(Color.SpenceKit.Background)
                        .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
                    
    //                HStack {
    //                    Extract(contentInactive) { view in
    //                        view.padding(.horizontal, 16)
    //                    }
    //                }
                            
                    
                    HStack {
                        Extract(contentActive) { active in
                            Extract(contentInactive) { inactive in
                                let inactive_active = Array(zip(active, inactive))
                                let indexed = Array(zip(active.indices, inactive_active))
                                HStack {
                                    ForEach(indexed, id: \.0) { index, views in
                                        if index == selection {
                                            views.0
                                        } else {
                                            views.1
                                                .onTapGesture {
                                                    withAnimation {
                                                        selection = index
                                                    }
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
                    }.padding(SpenceKit.Constants.padding8)
                        .measure(proxy)
                }.frame(maxWidth: geometry.size.width)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selectedTab: Int = 0
    
    VStack {
        TabSelector(
            $selectedTab,
            style: .CTA,
            tabs: [
                Tab("One"),
                Tab("Two"),
                Tab("Three")
            ]
        )
        TabSelector($selectedTab) {
            LargeChip("Item 1", style: .CTA)
            LargeChip("Item 2", style: .primary)
            LargeChip("Item 3", style: .secondary)
        } inactive: {
            LargeChip("Item 1", style: .secondary)
            LargeChip("Item 2", style: .tertiary)
            LargeChip("Item 3", style: .lowest)
        }.frame(width: 300)
    }
}

#endif

