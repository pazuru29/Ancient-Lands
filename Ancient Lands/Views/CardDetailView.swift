//
//  CardDetailView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 28.03.2024.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @Binding var isShowed: Bool
    
    let card: any ItemCardModelProtocol
    
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
                            .appSemiBlodFont(size: 22)
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
                        .appSemiBlodFont(size: 16)
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 4)
                    
                    Text(card.description)
                        .appRegularFont(size: 16)
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 2)
                }
                .padding(.bottom, 12)
                
                if card.type == .armor || card.type == .shield || card.type == .amplification {
                    buttonEquip()
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
    
    @ViewBuilder
    func buttonEquip() -> some View {
        let isEquipted = characterViewModel.currentCharacter?.equipment.shield?.id == card.id || characterViewModel.currentCharacter?.equipment.armor?.id == card.id ||
        characterViewModel.currentCharacter?.equipment.accessory?.id == card.id
        
        if isEquipted {
            Button("Take off") {
                gameViewModel.unequipCard(card: card)
                isShowed = false
            }
            .buttonStyle(MainButtonStyle())
        } else {
            Button("Equip") {
                gameViewModel.equipCard(card: card)
                isShowed = false
            }
            .buttonStyle(MainButtonStyle())
        }
    }
}
