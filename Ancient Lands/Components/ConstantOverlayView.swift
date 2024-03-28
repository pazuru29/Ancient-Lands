//
//  ConstantOverlayView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 28.03.2024.
//

import SwiftUI

struct ConstantOverlayView<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
                .opacity(0.8)
                .background(.ultraThinMaterial)
            
            content
        }
    }
}
