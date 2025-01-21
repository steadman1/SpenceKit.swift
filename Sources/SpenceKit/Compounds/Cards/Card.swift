//
//  File.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/21/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines Card for title-body, title-body-chip, or title-body-button paired content
public struct Card<ContentBody: View, ContentFooter: View>: View {
    
    public init(
        _ style: SpenceKitStyle = .primary,
        @ViewBuilder body: @escaping () -> ContentBody,
        @ViewBuilder footer: @escaping () -> ContentFooter
    ) {
        self.style = style
        self.contentBody = body()
        self.contentFooter = footer()
    }

//    TODO
//    public init(
//        @ViewBuilder body: @escaping () -> ContentBody,
//        @ViewBuilder chips: @escaping () -> ContentFooter
//    ) {
//        self.style = .primary
//        self.contentBody = body()
//        self.contentFooter = { Extract(chips) { view in
//            HStack {
//                view
//            }
//        } }() as! ContentFooter
//    }
    
    private let style: SpenceKitStyle
    private let contentBody: ContentBody
    private let contentFooter: ContentFooter
    
    public var body: some View {
        CornerRadiusReader { radius in
            let cornerRadius = radius > 0 ? radius : SpenceKit.Constants.cornerRadius24
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    contentBody
                        .padding(SpenceKit.Constants.padding16)
                    
                    Spacer()
                    
                    switch style {
                    case .CTA:
                        contentFooter
                            .padding(SpenceKit.Constants.padding8)
                    case .primary:
                        Divider(.horizontal)
                        contentFooter
                            .padding([.horizontal, .bottom], SpenceKit.Constants.padding8)
                    default:
                        EmptyView()
                    }
                    
                }.frame(maxWidth: geometry.size.width,
                        maxHeight: geometry.size.height)
                    .background(Color.SpenceKit.Background)
                    .roundBorder(cornerRadius)
            }
        }
    }
    
    private static func getTextLabel(for text: String, with style: SpenceKitStyle) -> Text {
        return Text(text)
            .font(.SpenceKit.HeadlineFont)
            .foregroundColor(
                Color.SpenceKit.standardColorBundle(for: style).foreground
            )
    }
}


@available(iOS 16.0, *)
#Preview {
    VStack {
        Card(SpenceKitStyle.CTA) {
            Text("Testing Card")
                .font(.SpenceKit.PrimaryTitleFont)
            Text("lorem impsum placeholder text to text body of card.")
                .font(.SpenceKit.BodyFont)
        } footer: {
            ExpandingButton(.CTA) {
                print()
            } label: {
                HStack {
                    SFIcon("checkmark", size: .head)
                    Text("Done")
                        .font(.SpenceKit.HeadlineFont)
                }
            }.cornerRadius(SpenceKit.Constants.cornerRadius16)
        }.frame(width: 200, height: 300)
        
        Card(SpenceKitStyle.primary) {
            VStack {
                Text("Testing Card")
                    .font(Font.SpenceKit.PrimaryTitleFont)
                Text("lorem impsum placeholder text to text body of card.")
                    .font(Font.SpenceKit.BodyFont)
            }
        } footer: {
            HStack {
                LargeChip("Option 1", style: .CTA)
                LargeChip("Option 1", style: .CTA)
            }
        }.frame(width: 200, height: 300)
    }
}

#endif
