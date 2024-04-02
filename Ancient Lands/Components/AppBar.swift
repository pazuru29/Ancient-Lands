//
//  AppBar.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct AppBar<Content: View>: View {
    let title: String
    
    @ViewBuilder let content: Content
    
    init(title: String = "", @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(title)
                    .appSemiBlodFont(size: 24)
                    .foregroundStyle(.appPrimary2)
                Spacer()
                content
            }
            .padding(.horizontal)
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
    AppBar(title: "Choose a character") {}
}
