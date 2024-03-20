//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct ItemCard: View {
    let card: ItemCardModel
    
    var body: some View {
        VStack(spacing: 0) {
            Image(card.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 87, height: 87)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                .overlay(content: {
                    UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                        .stroke(.appThirty2, lineWidth: 1)
                })
                .padding(.bottom, 6)
            
                Text(card.name)
                    .font(.custom("MontserratRoman-Medium", size: 9))
                    .foregroundStyle(.appPrimary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .frame(height: 34)
                    .background(.appThirty2)
                    .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
        }
        .padding(7)
        .background(.appPrimary2)
        .frame(width: 101, height: 138)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4, x: -2, y: 4)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.appThirty2, lineWidth: 1)
        }
    }
}

#Preview {
    VStack {
        HStack {
            ItemCard(card: CardStorage.wizardSet.first!.1)
        }
        BackOfCard()
    }
}
