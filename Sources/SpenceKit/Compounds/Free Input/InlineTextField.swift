//
//  InlineTextInput.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines InlineTextField for inline text input
public struct InlineTextField<IdentifierContent: View, HelperContent: View>: View {
    
    @Binding public var text: String
    @FocusState private var isFocused: Bool // Focus state for the TextField
    
    private let placeholder: String
    private let title: String
    private let description: String
    private let identifier: IdentifierContent
    private let hasIdentifier: Bool
    private let helperButton: HelperContent
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String = "",
        description: String = ""
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
        title: String = "",
        description: String = "",
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
        title: String = "",
        description: String = "",
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
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String = "",
        description: String = "",
        @ViewBuilder identifier: @escaping () -> IdentifierContent
    ) where HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = identifier()
        self.hasIdentifier = true
        self.helperButton = EmptyView()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if !title.isEmpty {
                HStack {
                    Text(title)
                        .font(.SpenceKit.HintFont)
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
                            .font(.SpenceKit.HeadFont)
                            .foregroundColor(Color.SpenceKit.TertiaryText)
                    }
                    TextField("", text: $text)
                        .font(.SpenceKit.HeadFont)
                        .focused($isFocused)
                }.padding(.horizontal,
                          SpenceKit.Constants.padding16 - (hasIdentifier ? SpenceKit.Constants.padding8 : 0) )
                
                Spacer()
                
                HStack {
                    if #available(iOS 16.0, *) {
                        Image(systemName: "keyboard.chevron.compact.down")
                            .font(.SpenceKit.HintFont)
                            .foregroundColor(Color.SpenceKit.PrimaryText)
                            .opacity(isFocused ? 1 : 0)
                            .offset(x: isFocused ? 0 : 12)
                            .animation(
                                .SpenceKit.Bouncy.quick,
                                value: isFocused
                            )
                            .onTapGesture {
                                isFocused = false
                            }
                    }
                    
                    helperButton
                }.padding(.trailing, SpenceKit.Constants.padding12)
                
            }.frame(maxWidth: .infinity)
                .frame(height: 48)
                .roundBorder(SpenceKit.Constants.cornerRadiusMAX)
            
            HStack {
                if !description.isEmpty {
                    HStack {
                        Text(description)
                            .font(.SpenceKit.SubheadFont)
                            .foregroundStyle(Color.SpenceKit.TertiaryText)
                    }
                }
                
                Spacer()
            }.padding(.top, SpenceKit.Constants.padding8)
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


#endif
