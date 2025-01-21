//
//  PasswordTextField.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI)

import SwiftUI

/// Defines PasswordInputField for password input
@available(iOS 16.0, *)
public struct PasswordInputField: View {
    
    @Binding public var text: String
    @State private var hidingText: Bool = true
    @FocusState private var isFocused: Bool
    
    private let placeholder: String
    private let title: String
    private let description: String

    public init(
        _ text: Binding<String>,
        placeholder: String = "",
        title: String = "",
        description: String = ""
    ) {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.description = description
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if !title.isEmpty {
                HStack {
                    Text(title)
                        .font(.SpenceKit.HeadFont)
                        .foregroundStyle(Color.SpenceKit.SecondaryText)
                        .padding(.bottom, SpenceKit.Constants.padding8)
                    Spacer()
                }
            }
            HStack(spacing: 0) {
                SFIcon("lock", size: .head)
                    .foregroundStyle(Color.SpenceKit.TertiaryText)
                    .padding(.leading, SpenceKit.Constants.padding16)
                
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder.isEmpty ? "Required" : placeholder)
                            .font(.SpenceKit.HeadFont)
                            .foregroundColor(Color.SpenceKit.TertiaryText)
                    }
                    
                    SecureField("", text: $text)
                        .font(.SpenceKit.HeadFont)
                        .focused($isFocused)
                        .opacity(hidingText ? 1 : 0)
                        .autocorrectionDisabled(true)
                        #if !os(macOS)
                        .textInputAutocapitalization(.never)
                        #endif
                    
                    TextField("", text: $text)
                        .font(.SpenceKit.HeadFont)
                        .focused($isFocused)
                        .opacity(hidingText ? 0 : 1)
                        .autocorrectionDisabled(true)
                        #if !os(macOS)
                        .textInputAutocapitalization(.never)
                        #endif
                }.padding(.horizontal,
                          SpenceKit.Constants.padding8)
                
                Spacer()
                
                HStack {
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
                    
                    if hidingText {
                        HelperButtons.Peek {
                            hidingText.toggle()
                        }
                    } else {
                        HelperButtons.Hide {
                            hidingText.toggle()
                        }
                    }
                }.padding(.trailing, SpenceKit.Constants.padding12)
                
            }.frame(maxWidth: .infinity)
                .frame(height: 48)
                .roundBorder(SpenceKit.Constants.cornerRadiusMAX)
            
            HStack {
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                        .frame(height: 6)
                        .animation(
                            .SpenceKit.Default.normal,
                            value: text.count
                        )
                        .foregroundStyle(
                            text.count > (index * 4) ? Color.SpenceKit.PrimaryAccent : Color.SpenceKit.LayerForeground
                        )
                }
            }.padding(.top, SpenceKit.Constants.padding8)
            
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
    PasswordInputField($text, title: "Password")
}



#endif
