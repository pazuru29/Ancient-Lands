//
//  PickCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI
import ToastUI

struct PickCardSet: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var isCharacterDetailShowed = false
    
    @State var selectedCards: TypeStartCards?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(TypeStartCards.allCases, id: \.self) { type in
                        VStack(spacing: 0) {
                            if selectedCards != type {
                                BackCardSet()
                                    .padding(.bottom, 48)
                            } else {
                                cardSetView(type: type)
                            }
                            
                            Text(type.rawValue)
                                .appRegularFont(size: 16)
                                .foregroundStyle(.appPrimary2)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.interactiveSpring) {
                                if selectedCards == type {
                                    selectedCards = nil
                                } else {
                                    selectedCards = type
                                }
                            }
                        }
                        .padding(.bottom, 64)
                    }
                    
                    Button("Cintinue") {
                        if let selectedCards = selectedCards {
                            characterViewModel.selectedCards = selectedCards
                            
                            navigationManager.addView(.createName)
                        }
                    }
                    .disabled(selectedCards == nil)
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 16)
                .padding(.top, 88)
                .padding(.bottom, 36)
            }
            .frame(maxWidth: .infinity)
            .scrollIndicators(.hidden)
            
            VStack {
                AppSecondaryBar(title: "Pick a card set") {
                    SmallCharacterCard(character: characterViewModel.selectedCharacter.getCharacteristic())
                        .onTapGesture {
                            withAnimation {
                                isCharacterDetailShowed = true
                            }
                        }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .background(.appPrimary)
        .toast(isPresented: $isCharacterDetailShowed, content: {
            CharacterDetailView(isShowed: $isCharacterDetailShowed, character: characterViewModel.selectedCharacter.getCharacteristic())
        })
    }
    
    
    func cardSetView(type: TypeStartCards) -> some View {
        let cards: Dictionary<Int, Int> = type.getCards()
        
        return HStack(spacing: -42) {
            ForEach(Array(cards), id: \.self.key) { cardID, count in
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
        .padding(.bottom, 45)
    }
}

#Preview {
    PickCardSet()
}
