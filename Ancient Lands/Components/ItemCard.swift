//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

enum CardSize {
    case small
    case medium
    case large
}

struct ItemCard: View {
    let card: ItemCardModel
    let size: CardSize
    let count: Int
    
    init(card: ItemCardModel, size: CardSize = .large, count: Int = 1) {
        self.card = card
        self.size = size
        self.count = count
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                Image(card.assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size == .small ? 55 : size == .medium ? 82 : 87, height: size == .small ? 55 : size == .medium ? 82 : 87)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: size == .small ? 2 : size == .medium ? 4 : 8, topTrailingRadius: size == .small ? 2 : size == .medium ? 4 : 8))
                    .overlay(content: {
                        UnevenRoundedRectangle(topLeadingRadius: size == .small ? 2 : size == .medium ? 4 : 8, topTrailingRadius: size == .small ? 2 : size == .medium ? 4 : 8)
                            .stroke(.appThirty2, lineWidth: 1)
                    })
                    .padding(.bottom, size == .small ? 2 : size == .medium ? 3 : 6)
                
                Text(card.name)
                    .font(.custom("MontserratRoman-Medium", size: size == .small ? 6 : size == .medium ? 7 : 9))
                    .foregroundStyle(.appPrimary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .frame(height: size == .small ? 21 : size == .medium ? 31 : 34)
                    .background(.appThirty2)
                    .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: size == .small ? 2 : size == .medium ? 4 : 8, bottomTrailingRadius: size == .small ? 2 : size == .medium ? 4 : 8))
            }
            .padding(size == .small ? 4.5 : size == .medium ? 6.5 : 7)
            .background(.appPrimary2)
            .frame(width: size == .small ? 64 : size == .medium ? 95 : 101, height: size == .small ? 87 : size == .medium ? 130 : 138)
            .clipShape(RoundedRectangle(cornerRadius: size == .small ? 4 : size == .medium ? 8 : 10))
            .shadow(radius: 4, x: -2, y: 4)
            .overlay {
                RoundedRectangle(cornerRadius: size == .small ? 4 : size == .medium ? 8 : 10)
                    .stroke(.appThirty2)
            }
            
            if count > 1 {
                Text("\(count)")
                    .font(.custom("MontserratRoman-SemiBold", size: size == .small ? 8 : size == .medium ? 12 : 12))
                    .foregroundStyle(.appPrimary)
                    .padding(.horizontal, size == .small ? 4 : 6)
                    .padding(.vertical, 2)
                    .background(.appThirty2)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: size == .small ? 2 : size == .medium ? 4 : 8, bottomTrailingRadius: size == .small ? 2 : size == .medium ? 4 : 8))
            }
        }
    }
}
