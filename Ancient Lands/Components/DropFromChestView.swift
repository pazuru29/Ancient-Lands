//
//  DropFromChestView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 28.03.2024.
//

import SwiftUI

struct DropFromChestView: View {
    @Binding var isOpen: Bool
    
    let drop: Dictionary<Int, Int>
    
    var body: some View {
        OverlayView(isShowed: $isOpen) {
            VStack(spacing: 0) {
                Text("You opened the chest, there were things in there:")
                    .font(.custom("MontserratRoman-SemiBold", size: 24))
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

#Preview {
    DropFromChestView(isOpen: .constant(true), drop: [:])
}
