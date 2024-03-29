//
//  ChooseTrapView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 29.03.2024.
//

import SwiftUI

struct ChooseTrapView: View {
    let hasTraps = CharacterViewModel.shared.currentCharacter!.inventory.keys.contains(6)
    let hasPoisonTrap = CharacterViewModel.shared.currentCharacter!.inventory.keys.contains(7)
    
    let trap = CardStorage.allCards.first(where: { $0.id == 6 })
    let poisonTrap = CardStorage.allCards.first(where: { $0.id == 7 })
    
    @State var selectedTrap: ItemCardModel?
    
    var body: some View {
        ConstantOverlayView() {
            VStack(spacing: 0) {
                Text("Pick a trap")
                    .font(.custom("MontserratRoman-SemiBold", size: 24))
                    .foregroundStyle(.appPrimary2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                HStack(spacing: 36) {
                    if hasTraps {
                        ItemCard(card: trap!, size: selectedTrap?.id == trap?.id ? .large : .medium)
                            .overlay {
                                if selectedTrap?.id != trap?.id {
                                    Color.gray.opacity(0.3)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                            .onTapGesture {
                                selectedTrap = trap
                            }
                    }
                    
                    if hasPoisonTrap {
                        ItemCard(card: poisonTrap!, size: selectedTrap?.id == poisonTrap?.id ? .large : .medium)
                            .overlay {
                                if selectedTrap?.id != poisonTrap?.id {
                                    Color.gray.opacity(0.3)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                            .onTapGesture {
                                selectedTrap = poisonTrap
                            }
                    }
                }
                .frame(height: 138)
                .padding(.bottom, 56)
                
                Button("Select") {
                    GameViewModel.shared.selectTrap(selectedTrap: selectedTrap!)
                }
                .buttonStyle(MainButtonStyle())
                .disabled(selectedTrap == nil)
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    ChooseTrapView()
}
