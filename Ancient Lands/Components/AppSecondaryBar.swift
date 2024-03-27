//
//  AppSecondaryBar.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct AppSecondaryBar<Content: View>: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    let title: String
    
    let needTrailingPadding: Bool
    
    @ViewBuilder let content: Content
    
    init(title: String, needTrailingPadding: Bool = true, @ViewBuilder content: () -> Content) {
        self.title = title
        self.needTrailingPadding = needTrailingPadding
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    navigationManager.removeLast()
                }, label: {
                    Image(systemName: "chevron.left")
                })
                .buttonStyle(IconButtonStyle())
                
                Text(title)
                    .font(.custom("MontserratRoman-Semibold", size: 24))
                    .foregroundStyle(.appPrimary2)
                Spacer()
                content
            }
            .padding(.trailing, needTrailingPadding ? 16 : 0)
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            .background(.appPrimary.opacity(0.85))
            .background(.ultraThinMaterial.opacity(0.95))
            
            Divider()
                .background(.appThirty)
        }
    }
}

#Preview {
    AppSecondaryBar(title: "Pick a card set") {}
}
