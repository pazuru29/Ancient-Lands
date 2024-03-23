//
//  PickCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

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
                                HStack(spacing: -42) {
                                    ForEach(Array(type.getCards().keys), id: \.self) { id in
                                        let card = CardStorage.allCards.first(where: { element in
                                            element.id == id
                                        })
                                        
                                        if card == nil {
                                            BackOfCard()
                                        } else {
                                            ItemCard(card: card!)
                                        }
                                    }
                                }
                                .padding(.bottom, 45)
                            }
                            
                            Text(type.rawValue)
                                .font(.custom("MontserratRoman-Regular", size: 16))
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
        .overlay {
            if isCharacterDetailShowed {
                CharacterDetailView(isShowed: $isCharacterDetailShowed, character: characterViewModel.selectedCharacter.getCharacteristic())
            }
        }
    }
}

#Preview {
    PickCardSet()
}
