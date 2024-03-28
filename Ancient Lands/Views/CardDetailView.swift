//
//  CardDetailView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 28.03.2024.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var isShowed: Bool
    
    let card: ItemCardModel
    
    var body: some View {
        OverlayView(isShowed: $isShowed) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    Image(card.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 148, height: 148)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.appThirty2, lineWidth: 1)
                        })
                        .padding(.trailing, 8)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        Text(card.name)
                            .font(.custom("MontserratRoman-SemiBold", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.appPrimary2)
                            .padding(.top, 10)
                        
                        Spacer()
                    }
                    .frame(height: 148)
                    
                    Spacer()
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Description:")
                        .font(.custom("MontserratRoman-SemiBold", size: 16))
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 4)
                    
                    Text(card.description)
                        .font(.custom("MontserratRoman-Regular", size: 16))
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 2)
                }
                .padding(.bottom, 12)
                
                if card.type == .armor || card.type == .shield || card.type == .amplification {
                    Button("Equip") {
                        //TODO: -
                    }
                    .buttonStyle(MainButtonStyle())
                }
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(.appPrimary.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.appSecondary, lineWidth: 4)
            })
            .padding(.horizontal, 24)
            .padding(.vertical, 48)
        }
    }
}
