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
    
    private let usesSpacers: Bool
    
    private let MAX_WIDTH: CGFloat = 440
    
    public init(
        _ selection: Binding<Int>,
        tabStyle: SpenceKitStyle = .primary,
        colorStyle: SpenceKitStyle = .primary,
        usesSpacers: Bool = true,
        tabs: [Tab]
    ) {
        self._selection = selection
        self._animate = .init(initialValue: selection.wrappedValue)
        self.tabs = tabs
        self.tabStyle = tabStyle
        self.usesSpacers = usesSpacers
        
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
        case .secondary:
            self.foregroundActive = .SpenceKit.PrimaryText
            self.foregroundInactive = .SpenceKit.PrimaryText
            self.background = .SpenceKit.PrimaryForeground
            self.border = .SpenceKit.Clear
        default:
            self.foregroundActive = .SpenceKit.PrimaryText
            self.foregroundInactive = .SpenceKit.PrimaryText
            self.background = .SpenceKit.Background
            self.border = .SpenceKit.Border
        }
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let isFloating = geometry.size.width > MAX_WIDTH
            HStack {
                if isFloating {
                    Spacer()
                }
                ZStack(alignment: .top) {
                    HStack {
                        ForEach(
                            Array(zip(tabs.indices, tabs)),
                            id: \.0
                        ) { index, tab in
                            let isActive = index == animate
                            HStack {
                                Button {
                                    selection = index
                                } label: {
                                    VStack {
                                        HStack(spacing: SpenceKit.Constants.spacing12) {
                                            (isActive ? tab.activeIcon : tab.inactiveIcon)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(
                                                    width: tabStyle == .tertiary ? 32 : 24,
                                                    height: tabStyle == .tertiary ? 32 : 24
                                                )
                                            if isActive && tabStyle == .primary {
                                                Text(tab.title)
                                                    .font(Font.SpenceKit.SansHeadlineFont)
                                            }
                                        }.foregroundStyle(
                                            isActive ? foregroundActive : foregroundInactive
                                        )
                                        
                                        if tabStyle == .tertiary {
                                            Text(tab.title)
                                                .font(Font.SpenceKit.SansHintFont)
                                                .foregroundStyle(
                                                    isActive ? foregroundActive : foregroundInactive
                                                )
                                        }
                                    }
                                }
                            }.padding(SpenceKit.Constants.padding12)
                                .padding(
                                    .trailing,
                                    tabStyle == .primary ? SpenceKit.Constants.padding4 : 0
                                )
                                .background(isActive && tabStyle != .tertiary ? background : Color.SpenceKit.Clear)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                                ).stroke(
                                    color: isActive ? border : Color.SpenceKit.Clear,
                                    width: SpenceKit.Constants.borderWidth
                                ).clipShape(
                                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                                )
                            
                            if (usesSpacers || isFloating) && index < tabs.count - 1 {
                                Spacer()
                            }
                        }
                    }.frame(maxWidth: MAX_WIDTH)
                        .padding(.horizontal, isFloating ? SpenceKit.Constants.padding16 : SpenceKit.Constants.padding12)
                        .padding(.top, SpenceKit.Constants.padding12)
                        .padding(.bottom, isFloating ? SpenceKit.Constants.padding12 : 0)
                    
                    if !isFloating {
                        HDivider()
                    }
                }.background(Color.SpenceKit.Background)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: isFloating ? SpenceKit.Constants.cornerRadiusMAX : 0
                        )
                    ).stroke(
                        color: isFloating ? Color.SpenceKit.Border : Color.SpenceKit.Clear,
                        width: SpenceKit.Constants.borderWidth
                    ).clipShape(
                        RoundedRectangle(
                            cornerRadius: isFloating ? SpenceKit.Constants.cornerRadiusMAX : 0
                        )
                    )
                if isFloating {
                    Spacer()
                }
            }
        }.frame(
            maxHeight: (tabStyle == .tertiary ? 32 : 24) + SpenceKit.Constants.padding16 * 3
        ).onChange(of: selection) { newValue in
            withAnimation(Animation.SpenceKit.Default.quick) {
                animate = newValue
            }
        }
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
                Tab(
                    title: "Home",
                    activeIcon: .init(systemName: "house.fill"),
                    inactiveIcon: .init(systemName: "house")
                ),
                Tab(
                    title: "Search",
                    activeIcon: .init(systemName: "magnifyingglass.circle.fill"),
                    inactiveIcon: .init(systemName: "magnifyingglass.circle")
                )
            ]
        )
    }
}

#endif
