//
//  Toggle.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/25/24.
//

#if canImport(SwiftUI)

import SwiftUI

struct Toggle: View {
    
    @Binding var isActive: Bool
    
    let WIDTH: CGFloat = 72
    
    var body: some View {
        ZStack(alignment: isActive ? .trailing : .leading) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX)
                    .frame(width: 16, height: 6)
                    .foregroundStyle(Color.SpenceKit.LayerForeground)
                Spacer()
                Circle()
                    .stroke(Color.SpenceKit.LayerForeground, lineWidth: 5)
                    .frame(width: 14)
                Spacer()
            }
            
            ZStack {
                Circle()
                    .fill(Color.SpenceKit.Background)
                    .padding(SpenceKit.Constants.padding4)
                Circle()
                    .fill(isActive ? Color.SpenceKit.Success : Color.SpenceKit.Failure)
                    .frame(width: 6, height: 6)
            }
        }.frame(width: WIDTH, height: 40)
            .background(Color.SpenceKit.PrimaryForeground)
            .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.22, extraBounce: 0.05)) {
                    isActive.toggle()
                }
            }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var isActive: Bool = false
    Toggle(isActive: $isActive)
}

#endif
