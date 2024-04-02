//
//  DropFromChestView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 28.03.2024.
//

import SwiftUI

struct DropView: View {
    @Binding var isOpen: Bool
    
    let title: String
    
    let drop: Dictionary<Int, Int>
    
    var body: some View {
        OverlayView(isShowed: $isOpen) {
            VStack(spacing: 0) {
                Text(title)
                    .appSemiBlodFont(size: 24)
                    .foregroundStyle(.appPrimary2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(Array(drop), id: \.self.key) { cardID, count in
                        let card = CardStorage.allCards.first(where: { element in
                            element.id == cardID
                        })
                        
                        if card == nil {
                            BackOfCard()
                        } else {
                            ItemCard(card: card!, count: count)
                        }
                    }
                }
            }
            .onTapGesture {
                withAnimation {
                    isOpen = false
                }
            }
            .padding(.horizontal, 24)
        }
    }
}
