//
//  ProgressSelector.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/23/24.
//

#if canImport(SwiftUI)

import SwiftUI
import ViewExtractor
import MeasurementReader

@available(iOS 16.0, *)
public struct ProgressSelector<ContentCompleted: View, ContentActive: View, ContentInactive: View, ContentFinish: View>: View {
    
    @Binding var selection: Int
    
    private let padding: CGFloat
    private let style: SpenceKitStyle
    private let contentInactive: ContentInactive
    private let contentActive: ContentActive
    private let contentCompleted: ContentCompleted
    private let contentFinish: ContentFinish
    private let hasFinish: Bool
    private let placeholder: String?
    private let skippable: Bool
    
    public init(
        _ selection: Binding<Int>,
        style: SpenceKitStyle,
        size: SpenceKitSize = .large,
        placeholder: String? = nil,
        skippable: Bool = true,
        labels: [String],
        padding: CGFloat = SpenceKit.Constants.padding16
    ) where ContentCompleted == AnyView, ContentActive == AnyView, ContentInactive == AnyView, ContentFinish == AnyView {
        self._selection = selection
        self.padding = padding
        self.style = style
        self.placeholder = placeholder ?? "Finish"
        self.skippable = true
        self.hasFinish = placeholder != nil
        self.contentCompleted = {
            AnyView(
                ForEach(Array(zip(labels.indices, labels)), id: \.0) { index, name in
                    switch size {
                    case .large:
                        LargeChip("checkmark", name, style: .primary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    default:
                        SmallChip("checkmark", name, style: .primary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    }
                }
            )
        }() as ContentCompleted
        self.contentActive = {
            AnyView(
                ForEach(Array(zip(labels.indices, labels)), id: \.0) { index, name in
                    switch size {
                    case .large:
                        LargeChip(name, style: .secondary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    default:
                        SmallChip(name, style: .secondary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    }
                    
                }
            )
        }() as ContentActive
        self.contentInactive = {
            AnyView(
                ForEach(Array(zip(labels.indices, labels)), id: \.0) { index, name in
                    switch size {
                    case .large:
                        LargeChip(name, style: .tertiary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    default:
                        SmallChip(name, style: .tertiary) {
                            ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                                to: index,
                                selection: selection,
                                skippable: skippable
                            )
                        }
                    }
                }
            )
        }() as ContentInactive
        self.contentFinish = {
            switch size {
            case .large:
                AnyView(
                    LargeChip("arrow.up.right", placeholder ?? "Finish", style: .CTA) {
                        ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                            to: labels.count,
                            selection: selection,
                            skippable: skippable
                        )
                    }.disabled(!skippable)
                )
            default:
                AnyView(
                    SmallChip("arrow.up.right", placeholder ?? "Finish", style: .CTA) {
                        ProgressSelector<AnyView, AnyView, AnyView, AnyView>.changeSelection(
                            to: labels.count,
                            selection: selection,
                            skippable: skippable
                        )
                    }.disabled(!skippable)
                )
            }
        }() as ContentFinish
    }
    
    // doesnt have finish
    public init(
        _ selection: Binding<Int>,
        padding: CGFloat = SpenceKit.Constants.padding16,
        skippable: Bool = true,
        @ViewBuilder completed: @escaping () -> ContentCompleted,
        @ViewBuilder active: @escaping () -> ContentActive,
        @ViewBuilder inactive: @escaping () -> ContentInactive
    ) where ContentFinish == EmptyView {
        self._selection = selection
        self.padding = padding
        self.style = .lowest
        self.placeholder = nil
        self.hasFinish = false
        self.skippable = skippable
        self.contentCompleted = completed()
        self.contentActive = active()
        self.contentInactive = inactive()
        self.contentFinish = EmptyView()
    }
    
    // has finish
    public init(
        _ selection: Binding<Int>,
        padding: CGFloat = SpenceKit.Constants.padding16,
        skippable: Bool = true,
        @ViewBuilder completed: @escaping () -> ContentCompleted,
        @ViewBuilder active: @escaping () -> ContentActive,
        @ViewBuilder inactive: @escaping () -> ContentInactive,
        @ViewBuilder finish: @escaping () -> ContentFinish
    ) {
        self._selection = selection
        self.padding = padding
        self.style = .lowest
        self.placeholder = nil
        self.hasFinish = true
        self.skippable = skippable
        self.contentCompleted = completed()
        self.contentActive = active()
        self.contentInactive = inactive()
        self.contentFinish = finish()
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
                            if totalWidth > screenWidth - padding - (proxy.maxWidth(indexed.count) ?? 0) || totalWidth == 0 {
                                ScrollViewReader { scrollProxy in
                                    ScrollView(.horizontal) {
                                        chipsContentView(indexed: indexed, proxy: proxy)
                                            .onChange(of: selection) { newSelection in
                                                withAnimation {
                                                    scrollProxy.scrollTo(newSelection, anchor: .center)
                                                }
                                            }
                                    }
                                    .scrollIndicators(.never)
                                }
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
            }.padding(.horizontal, padding)
            
            HStack {
                HStack {
                    ForEach(indexed, id: \.0) { index, views in
                        if index == selection {
                            views.0
                                .measure(proxy, index)
                                .id(index)
                        } else if index < selection {
                            views.1.0
                                .measure(proxy, index)
                                .id(index)
                        } else {
                            views.1.1
                                .measure(proxy, index)
                                .id(index)
                        }
                        
                        if (index < indexed.count - 1) || hasFinish {
                            Spacer()
                        }
                    }
                }
                
                if hasFinish {
                    contentFinish
                        .measure(proxy, indexed.count)
                        .id(indexed.count)
                }
            }.padding(.horizontal, padding)
        }
    }

    static func changeSelection(
        to index: Int,
        selection: Binding<Int>,
        skippable: Bool
    ) {
        if (skippable && index > selection.wrappedValue)
            || index < selection.wrappedValue {
            
            selection.wrappedValue = index
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selection = 1
    VStack {
        ProgressSelector($selection, style: .CTA, placeholder: "Done", skippable: true, labels: ["one", "one", "one"])
        ProgressSelector($selection) {
            LargeChip("Item 1", style: .CTA)
            LargeChip("Item 2", style: .primary)
            LargeChip("Item 3", style: .secondary)
            LargeChip("Item 4", style: .tertiary)
        } active: {
            LargeChip("Item 1", style: .CTA)
            LargeChip("Item 2", style: .primary)
            LargeChip("Item 3", style: .secondary)
            LargeChip("Item 4", style: .tertiary)
        } inactive: {
            LargeChip("Item 1", style: .secondary)
            LargeChip("Item 2", style: .tertiary)
            LargeChip("Item 3", style: .tertiary)
            LargeChip("Item 4", style: .tertiary)
        } finish: {
            LargeChip("checkmark", "Finish", style: .primary)
        }
    }
}

#endif


