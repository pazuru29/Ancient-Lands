//
//  CharacterDetailView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct OverlayView<Content: View>: View {
    @Binding var isShowed: Bool
    
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
                .opacity(0.8)
                .background(.ultraThinMaterial)
                .onTapGesture {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isShowed = false
                    }
                }
            
            content
        }
    }
}

#Preview {
    OverlayView(isShowed: .constant(true)) {
        VStack {
            Text("Hello")
        }
    }
}
