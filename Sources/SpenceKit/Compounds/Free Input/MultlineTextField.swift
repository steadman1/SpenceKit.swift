//
//  InlineTextInput.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines MultilineTextField for multiline text input
public struct MultilineTextField<IdentifierContent: View, HelperContent: View>: View {
    
    @Binding public var text: String
    @FocusState private var isFocused: Bool // Focus state for the TextEditor
    private let maxCharacters: Int // Maximum character count
    
    private let placeholder: String
    private let title: String
    private let description: String
    private let identifier: IdentifierContent
    private let hasIdentifier: Bool
    private let helperButton: HelperContent
    private let hasHelperButton: Bool
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String = "",
        description: String = "",
        maxCharacters: Int = 250
    ) where IdentifierContent == EmptyView, HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
        self.hasHelperButton = false
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String = "",
        maxCharacters: Int = 250,
        @ViewBuilder helperButton: @escaping () -> HelperContent
    ) where IdentifierContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = helperButton()
        self.hasHelperButton = true
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String = "",
        maxCharacters: Int = 250,
        @ViewBuilder identifier: @escaping () -> IdentifierContent
    ) where HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = identifier()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
        self.hasHelperButton = true
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String = "",
        maxCharacters: Int = 250,
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
        self.hasHelperButton = true
        self.maxCharacters = maxCharacters
    }
    
    public var body: some View {
        GeometryReader { geometry in
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
                HStack(alignment: .top, spacing: 0) {
                    identifier
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                        .padding([.top, .leading], SpenceKit.Constants.padding16)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $text)
                            .font(.SpenceKit.HeadFont)
                            .focused($isFocused)
                            .padding(.top, SpenceKit.Constants.padding4)
                            .padding(.horizontal, SpenceKit.Constants.padding12 - (hasIdentifier ? SpenceKit.Constants.padding8 : 0))
                            .onChange(of: text) { newText in
                                if newText.count > maxCharacters {
                                    text = String(newText.prefix(maxCharacters))
                                }
                            }
                        
                        if text.isEmpty {
                            Text(placeholder.isEmpty ? "Enter text" : placeholder)
                                .font(.SpenceKit.HeadFont)
                                .foregroundColor(Color.SpenceKit.TertiaryText)
                                .padding(.top, SpenceKit.Constants.padding8 + 4)
                                .padding(.horizontal, SpenceKit.Constants.padding12 + 5 - (hasIdentifier ? SpenceKit.Constants.padding8 : 0))
                        }
                    }
                    
                    VStack {
                        helperButton
                        
                        Spacer()
                        
                        if #available(iOS 16.0, *) {
                            Image(systemName: "keyboard.chevron.compact.down")
                                .font(.SpenceKit.HintFont)
                                .foregroundColor(Color.SpenceKit.PrimaryText)
                                .opacity(isFocused ? 1 : 0)
                                .offset(y: isFocused ? 0 : 12)
                                .animation(
                                    .SpenceKit.Bouncy.quick,
                                    value: isFocused
                                )
                                .onTapGesture {
                                    isFocused = false
                                }
                        }
                    }.padding([.vertical, .trailing], SpenceKit.Constants.padding16)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: min(
                        CGFloat(maxCharacters / 2),
                        geometry.size.height
                    )
                )
                .roundBorder(SpenceKit.Constants.cornerRadius24)
                
                HStack {
                    Text(description)
                        .font(.SpenceKit.SubheadFont)
                        .foregroundColor(Color.SpenceKit.TertiaryText)
                    
                    Spacer()
                    
                    Text("\(text.count)/\(maxCharacters)")
                        .font(.SpenceKit.SubheadFont)
                        .foregroundColor(Color.SpenceKit.TertiaryText)
                }
                .padding(.top, SpenceKit.Constants.padding8)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var text: String = ""
    VStack {
        MultilineTextField("Placeholder", $text, maxCharacters: 200)
        MultilineTextField("Placeholder", $text, title: "Title", description: "This is a space for more info.", maxCharacters: 500)
        MultilineTextField("Placeholder", $text, title: "Title", maxCharacters: 500)
        MultilineTextField("Enter Text...", $text, title: "Title", description: "More info...", maxCharacters: 500) {
            SFIcon("arrow.up.right", size: .head)
        } helperButton: {
            HelperButtons.Info {
                print()
            }
        }
        Spacer()
    }
}


#endif
