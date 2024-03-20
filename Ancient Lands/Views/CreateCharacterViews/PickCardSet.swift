//
//  PickCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct PickCardSet: View {
    let character: TypeOfCharacter
    
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
                                cardSetView(type)
                            }
                            
                            Text(type.rawValue)
                                .font(.custom("MontserratRoman-Regular", size: 16))
                                .foregroundStyle(.appPrimary2)
                        }
                        //TODO: cklik onli on content ??
                        .frame(maxWidth: .infinity)
                        .containerShape(Rectangle())
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
                    
                    NavigationLink("Cintinue") {
                        if let selectedCards = selectedCards {
                            //TODO: - navigate to change name
                        }
                    }
                    .disabled(selectedCards == nil)
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 16)
                .padding(.top, 90)
                .padding(.bottom, 36)
            }
            .frame(maxWidth: .infinity)
            .scrollIndicators(.hidden)
            
            VStack {
                AppSecondaryBar(title: "Pick a card set") {
                    SmallCharacterCard(character: character.getCharacteristic())
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
                CharacterDetailView(isShowed: $isCharacterDetailShowed, character: character.getCharacteristic())
            }
        }
    }
    
    func cardSetView(_ type: TypeStartCards) -> some View {
        var cards: Array<(Int, ItemCardModel)>
        
        switch(type) {
        case .elf:
            cards = CardStorage.elfSet
        case .knight:
            cards = CardStorage.knightSet
        case .wizard:
            cards = CardStorage.wizardSet
        }
        
        return HStack(spacing: -42) {
            ForEach(cards, id: \.self.1) { num, card in
                ItemCard(card: card)
            }
        }
        .padding(.bottom, 45)
    }
}

#Preview {
    PickCardSet(character: TypeOfCharacter.elfWm)
}
