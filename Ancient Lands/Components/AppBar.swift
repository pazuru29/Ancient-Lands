//
//  AppBar.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct AppBar: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(title)
                    .font(.custom("MontserratRoman-Semibold", size: 24))
                    .foregroundStyle(.appPrimary2)
                Spacer()
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
    AppBar(title: "Choose a character")
}
