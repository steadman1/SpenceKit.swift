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
public struct TabBar: View {
    
    @Binding var selection: Int
    @State private var animate: Int

    private let tabs: [Tab]
    
    private let tabStyle: SpenceKitStyle
    private let foregroundActive: Color
    private let foregroundInactive: Color
    private let background: Color
    private let border: Color
    
    public init(
        _ selection: Binding<Int>,
        tabStyle: SpenceKitStyle,
        colorStyle: SpenceKitStyle,
        tabs: [Tab]
    ) {
        self._selection = selection
        self._animate = .init(initialValue: selection.wrappedValue)
        self.tabs = tabs
        self.tabStyle = tabStyle
        
        switch colorStyle {
        case .CTA:
            self.foregroundActive = .SpenceKit.PrimaryCTA
            self.foregroundInactive = .SpenceKit.SecondaryCTA
            self.background = .SpenceKit.SecondaryCTA
            self.border = .SpenceKit.Clear
        case .primary:
            self.foregroundActive = .SpenceKit.PrimaryAccent
            self.foregroundInactive = .SpenceKit.PrimaryAccent
            self.background = .SpenceKit.SecondaryAccent
            self.border = .SpenceKit.Clear
        default:
            self.foregroundActive = .SpenceKit.PrimaryText
            self.foregroundInactive = .SpenceKit.PrimaryText
            self.background = .SpenceKit.PrimaryForeground
            self.border = .SpenceKit.Clear
        }
    }
    
    public var body: some View {
        HStack {
            ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, tab in
                let isActive = index == animate
                HStack {
                    Button {
                        selection = index
                        withAnimation(Animation.SpenceKit.Bouncy.Quick) {
                            animate = index
                        }
                    } label: {
                        HStack(spacing: SpenceKit.Constants.spacing) {
                            tab.activeIcon
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            if isActive {
                                Text(tab.title)
                                    .font(Font.SpenceKit.SansHeadlineFont)
                            }
                        }.foregroundStyle(
                            isActive ? foregroundActive : foregroundInactive
                        )
                    }
                }.padding(SpenceKit.Constants.padding12)
                    .padding(.trailing, SpenceKit.Constants.padding4)
                    .background(isActive ? background : Color.SpenceKit.Clear)
                    .clipShape(
                        RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    )
                    .stroke(color: border, width: SpenceKit.Constants.borderWidth)
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
        TabBar(
            $selectedTab,
            tabStyle: .primary,
            colorStyle: .CTA,
            tabs: [
                Tab(title: "Home", icon: .init(systemName: "house.fill")),
                Tab(title: "Search", icon: .init(systemName: "magnifyingglass.circle.fill"))
            ]
        )
    }
}

#endif
