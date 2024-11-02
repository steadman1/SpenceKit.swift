//
//  InlineTextInput.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI

public struct InlineTextField<IdentifierContent: View, HelperContent: View>: View {
    
    @Binding public var text: String
    
    private let placeholder: String
    private let title: String
    private let description: String
    private let identifier: IdentifierContent
    private let hasIdentifier: Bool
    private let helperButton: HelperContent
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>
    ) where IdentifierContent == EmptyView, HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = ""
        self.description = ""
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String
    ) where IdentifierContent == EmptyView, HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String,
        @ViewBuilder helperButton: @escaping () -> HelperContent
    ) where IdentifierContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = helperButton()
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String,
        @ViewBuilder identifier: @escaping () -> IdentifierContent,
        @ViewBuilder helperButton: @escaping () -> HelperContent
    ) {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = identifier()
        self.hasIdentifier = true
        self.helperButton = helperButton()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if !title.isEmpty {
                HStack {
                    Text(title)
                        .font(.SpenceKit.SansHeadlineFont)
                        .foregroundStyle(Color.SpenceKit.SecondaryText)
                        .padding(.bottom, SpenceKit.Constants.padding8)
                    Spacer()
                }
            }
            HStack(spacing: 0) {
                identifier
                    .foregroundStyle(Color.SpenceKit.TertiaryText)
                    .padding(.leading, SpenceKit.Constants.padding16)
                
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder.isEmpty ? "Enter text" : placeholder)
                            .font(.SpenceKit.SansHeadFont)
                            .foregroundColor(Color.SpenceKit.TertiaryText)
                    }
                    TextField("", text: $text)
                        .font(.SpenceKit.SansHeadFont)
                }.padding(.horizontal,
                          SpenceKit.Constants.padding16 - (hasIdentifier ? SpenceKit.Constants.padding8 : 0) )
                
                Spacer()
                
                helperButton
                    .padding(.trailing, SpenceKit.Constants.padding16)
                
            }.frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.SpenceKit.Background)
                .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
                .stroke(color: Color.SpenceKit.Border,
                     width: SpenceKit.Constants.borderWidth)
                .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX + SpenceKit.Constants.borderWidth * 2))
            
            HStack {
                if !description.isEmpty {
                    HStack {
                        Text(description)
                            .font(.SpenceKit.SansSubheadFont)
                            .foregroundStyle(Color.SpenceKit.TertiaryText)
                            .padding(.top, SpenceKit.Constants.padding8)
                        Spacer()
                    }
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var text: String = ""
    InlineTextField("?", $text)
    InlineTextField("Placeholder", $text, title: "title!", description: "more info...")
    InlineTextField("Enter Text...", $text, title: "title!", description: "more info...") {
        SFIcon("arrow.up.right", size: .head)
    } helperButton: {
        HelperButtons.Info {
            print()
        }
    }
}
