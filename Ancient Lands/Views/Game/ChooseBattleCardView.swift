//
//  ChooseBattleCardView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 29.03.2024.
//

import SwiftUI
import ToastUI

struct ChooseBattleCardView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @Binding var isOpen: Bool
    
    @State var arrayOfCards: Array<(ItemType, Array<(Int, ItemCardModel)>)> = []
    
    @State var isDetailCardShowed: Bool = false
    @State var currentDetailCard: ItemCardModel? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            Text(gameViewModel.titleBattleItems)
                .font(.custom("MontserratRoman-Semibold", size: 24))
                .foregroundStyle(.appPrimary2)
                .padding([.bottom, .horizontal])
                .padding(.top, 24)
            
            Color.appThirty2
                .frame(height: 1)
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(arrayOfCards, id: \.self.0) { (type, array) in
                        cardTypeView(type: type, arrayOfCards: array)
                    }
                }
                .padding(.top, 36)
            }
            
            Button("Select") {
                isOpen = false
            }
            .buttonStyle(MainButtonStyle())
            .padding([.bottom, .horizontal], 24)
            .padding(.top, 8)
        }
        .onAppear() {
            getInitData()
        }
        .toast(isPresented: $isDetailCardShowed, content: {
            CardDetailView(isShowed: $isDetailCardShowed, card: currentDetailCard!)
        })
    }
    
    @ViewBuilder
    private func cardTypeView(type: ItemType, arrayOfCards: Array<(Int, ItemCardModel)>) -> some View {
        VStack(spacing: 0) {
            Text(type.rawValue)
                .font(.custom("MontserratRoman-Semibold", size: 20))
                .foregroundStyle(.appThirty2)
                .padding(.bottom, 10)
            
            Color.appThirty2.opacity(0.5)
                .frame(height: 1)
                .padding(.horizontal)
                .padding(.bottom, 14)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                ForEach(arrayOfCards, id: \.self.1) { (count, card) in
                    ItemCard(card: card, size: .medium, count: count)
                        .padding(.bottom, 36)
                        .onLongPressGesture(perform: {
                            dPrint("CLICK ON CARD")
                            currentDetailCard = card
                            withAnimation {
                                isDetailCardShowed = true
                            }
                        })
                }
            }
        }
    }
    
    private func getInitData() {
        dPrint("TAKE INIT LIST OF CARDS")
        
        var cards: Array<(Int, ItemCardModel)> = []
        
        let arrayOfId = Array(characterViewModel.currentCharacter!.inventory)
        
        for item in arrayOfId {
            let card = CardStorage.allCards.first { card in
                card.id == item.key
            }
            
            cards.append((item.value, card!))
        }
        
        for type in gameViewModel.typesOfBattleItems {
            let filtredCards = cards.filter({ (count, card) in
                card.type == type
            })
            
            if !filtredCards.isEmpty {
                arrayOfCards.append((type, filtredCards))
            }
        }
    }
}
