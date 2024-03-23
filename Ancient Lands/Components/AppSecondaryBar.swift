//
//  AppSecondaryBar.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct AppSecondaryBar<Content: View>: View {
    let title: String
    
    @ViewBuilder let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    NavigationManager.shared.removeLast()
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
            .padding(.trailing)
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
