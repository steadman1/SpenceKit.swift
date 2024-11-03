//
//  InlineTextInput.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI

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
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        maxCharacters: Int
    ) where IdentifierContent == EmptyView, HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = ""
        self.description = ""
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String,
        maxCharacters: Int
    ) where IdentifierContent == EmptyView, HelperContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = EmptyView()
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String,
        maxCharacters: Int,
        @ViewBuilder helperButton: @escaping () -> HelperContent
    ) where IdentifierContent == EmptyView {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
        self.identifier = EmptyView()
        self.hasIdentifier = false
        self.helperButton = helperButton()
        self.maxCharacters = maxCharacters
    }
    
    public init(
        _ placeholder: String,
        _ text: Binding<String>,
        title: String,
        description: String,
        maxCharacters: Int,
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
        self.maxCharacters = maxCharacters
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
            HStack(alignment: .top, spacing: 0) {
                identifier
                    .foregroundStyle(Color.SpenceKit.TertiaryText)
                    .padding([.top, .leading], SpenceKit.Constants.padding16)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .font(.SpenceKit.SansHeadFont)
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
                            .font(.SpenceKit.SansHeadFont)
                            .foregroundColor(Color.SpenceKit.TertiaryText)
                            .padding(.top, SpenceKit.Constants.padding8 + 4)
                            .padding(.horizontal, SpenceKit.Constants.padding12 + 5 - (hasIdentifier ? SpenceKit.Constants.padding8 : 0))
                    }
                }
                
                Spacer()
                
                helperButton
                    .padding([.top, .trailing], SpenceKit.Constants.padding16)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .background(Color.SpenceKit.Background)
            .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24))
            .overlay(
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24)
                    .stroke(Color.SpenceKit.Border, lineWidth: SpenceKit.Constants.borderWidth)
            )
            
            HStack {
                Text("\(text.count)/\(maxCharacters)")
                    .font(.SpenceKit.SansSubheadFont)
                    .foregroundColor(Color.SpenceKit.TertiaryText)
                
                Spacer()
                
                if isFocused, #available(iOS 16.0, *) {
                    Button {
                        isFocused = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                            .font(.SpenceKit.SansHintFont)
                            .foregroundColor(Color.SpenceKit.PrimaryText)
                    }
                }
            }
            .padding(.top, SpenceKit.Constants.padding8)
            .padding(.horizontal, SpenceKit.Constants.padding16)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var text: String = ""
    VStack {
        MultilineTextField("Placeholder", $text, title: "Title", description: "More info...", maxCharacters: 200)
        MultilineTextField("Enter Text...", $text, title: "Title", description: "More info...", maxCharacters: 200) {
            SFIcon("arrow.up.right", size: .head)
        } helperButton: {
            HelperButtons.Info {
                print()
            }
        }
        Spacer()
    }
}
