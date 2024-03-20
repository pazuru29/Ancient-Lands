//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct ItemCard: View {
    let card: ItemCardModel
    let isSmall: Bool
    
    init(card: ItemCardModel, isSmall: Bool = false) {
        self.card = card
        self.isSmall = isSmall
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Image(card.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: isSmall ? 55 : 87, height: isSmall ? 55 : 87)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: isSmall ? 2 : 8, topTrailingRadius: isSmall ? 2 : 8))
                .overlay(content: {
                    UnevenRoundedRectangle(topLeadingRadius: isSmall ? 2 : 8, topTrailingRadius: isSmall ? 2 : 8)
                        .stroke(.appThirty2, lineWidth: 1)
                })
                .padding(.bottom, isSmall ? 2 : 6)
            
            Text(card.name)
                .font(.custom("MontserratRoman-Medium", size: isSmall ? 6 : 9))
                .foregroundStyle(.appPrimary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: isSmall ? 21 : 34)
                .background(.appThirty2)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: isSmall ? 2 : 8, bottomTrailingRadius: isSmall ? 2 : 8))
        }
        .padding(isSmall ? 4.5 : 7)
        .background(.appPrimary2)
        .frame(width: isSmall ? 64 : 101, height: isSmall ? 87 : 138)
        .clipShape(RoundedRectangle(cornerRadius: isSmall ? 4 : 10))
        .shadow(radius: 4, x: -2, y: 4)
        .overlay {
            RoundedRectangle(cornerRadius: isSmall ? 4 : 10)
                .stroke(.appThirty2)
        }
    }
}
