//
//  IconProgressSelector.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/25/24.
//

#if canImport(SwiftUI)

import SwiftUI
import ViewExtractor
import MeasurementReader

@available(iOS 16.0, *)
public struct IconProgressSelector<ContentCompleted: View, ContentActive: View, ContentInactive: View, ContentFinish: View>: View {
    
    @Binding var selection: Int
    
    private let style: SpenceKitStyle
    private let contentInactive: ContentInactive
    private let contentActive: ContentActive
    private let contentCompleted: ContentCompleted
    private let contentFinish: ContentFinish
    private let hasFinish: Bool
    
    public init(
        _ selection: Binding<Int>,
        style: SpenceKitStyle,
        size: SpenceKitSize = .large,
        hasFinish: Bool = false,
        labels: [String]
    ) where ContentCompleted == AnyView, ContentActive == AnyView, ContentInactive == AnyView, ContentFinish == AnyView {
        self._selection = selection
        self.style = style
        self.hasFinish = hasFinish
        self.contentCompleted = {
            AnyView(
                ForEach(Array(zip(labels.indices, labels)), id: \.0) { index, name in
                    switch size {
                    case .large:
                        IconButton(.primary) {
                            
                        } label: {
                            SFIcon("checkmark", size: .head)
                        }
                    default:
                        IconButton(.primary) {
                            
                        } label: {
                            SFIcon("checkmark", size: .subhead)
                        }
                    }
                }
            )
        }() as ContentCompleted
        self.contentActive = {
            AnyView(
                ForEach(labels, id: \.self) { name in
                    switch size {
                    case .large:
                        LargeChip(name, style: .secondary)
                    default:
                        SmallChip(name, style: .secondary)
                    }
                    
                }
            )
        }() as ContentActive
        self.contentInactive = {
            AnyView(
                ForEach(labels, id: \.self) { name in
                    switch size {
                    case .large:
                        LargeChip(name, style: .tertiary)
                    default:
                        SmallChip(name, style: .tertiary)
                    }
                }
            )
        }() as ContentInactive
        self.contentFinish = {
            switch size {
            case .large:
                AnyView(LargeChip("arrow.up.right", "Finish", style: .CTA))
            default:
                AnyView(SmallChip("arrow.up.right", "Finish", style: .CTA))
            }
        }() as ContentFinish
    }
    
    public var body: some View {
        GeometryReader { geometry in
            MeasurementReader<Any, Range<_VariadicView_Children.Index>.Element> { proxy in
                let screenWidth = geometry.size.width
                Extract(contentCompleted) { active in
                    Extract(contentInactive) { inactive in
                        Extract(contentActive) { completed in
                            let inactive_active = Array(zip(active, inactive))
                            let completed_ia = Array(zip(completed, inactive_active))
                            let indexed = Array(zip(active.indices, completed_ia))
                            
                            // Calculate total width of all chips
                            let totalWidth = indexed.reduce(0) { total, item in
                                let chipWidth = proxy.maxWidth(item.0)
                                return total + (chipWidth ?? 0) + SpenceKit.Constants.padding16
                            }
                            
                            // Check if total width exceeds screen width
                            if totalWidth > screenWidth - (proxy.maxWidth(indexed.count) ?? 0) || totalWidth == 0 {
                                ScrollView(.horizontal) {
                                    chipsContentView(indexed: indexed, proxy: proxy)
                                }.scrollIndicators(.never)
                            } else {
                                chipsContentView(indexed: indexed, proxy: proxy)
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    func chipsContentView(indexed: [(Int, ((_VariadicView_Children.Element, (_VariadicView_Children.Element, _VariadicView_Children.Element))))], proxy: MeasurementProxy<Range<_VariadicView_Children.Index>.Element>) -> some View {
        ZStack {
            HStack {
                ForEach(indexed, id: \.0) { index, _ in
                    Spacer()
                        .frame(width: proxy.maxWidth(index))
                    
                    if (index < indexed.count - 1) || hasFinish {
                        HDivider()
                            .padding(.horizontal, SpenceKit.Constants.padding4)
                    }
                }
                
                if hasFinish {
                    Spacer()
                        .frame(width: proxy.maxWidth(indexed.count))
                }
            }
            
            HStack {
                HStack {
                    ForEach(indexed, id: \.0) { index, views in
                        if index == selection {
                            views.0
                                .measure(proxy, index)
                        } else if index < selection {
                            views.1.0
                                .measure(proxy, index)
                        } else {
                            views.1.1
                                .measure(proxy, index)
                        }
                        
                        if (index < indexed.count - 1) || hasFinish {
                            Spacer()
                        }
                    }
                }
                
                if hasFinish {
                    contentFinish.measure(proxy, indexed.count)
                }
            }
        }
    }

    
    func changeSelection(to index: Int) {
        selection = index
    }
}

#Preview {
    VStack {
        if #available(iOS 16.0, *) {
            ProgressSelector(.constant(3), style: .CTA, hasFinish: true, labels: ["one", "one", "one"])
        }
    }
}

#endif



