//
//  InventoryView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import SwiftUI

struct InventoryView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var listOfView: Array<AnyView> = []
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Inventory")
                .font(.custom("MontserratRoman-Semibold", size: 24))
                .foregroundStyle(.appPrimary2)
                .padding([.bottom, .horizontal])
                .padding(.top, 24)
            
            Divider()
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 0) {
                    equipmentView()
                        .padding(.horizontal, 16)
                        .padding(.bottom, 48)
                    
                    typesView()
                }
                .padding(.vertical, 24)
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            getInitData()
        }
    }
    
    @ViewBuilder
    func equipmentView() -> some View {
        VStack(spacing: 0) {
            Text("Equipment")
                .font(.custom("MontserratRoman-Semibold", size: 20))
                .foregroundStyle(.appThirty2)
                .padding(.bottom, 24)
            
            HStack(spacing: 0) {
                equipmentItemView(title: "Armor", card: characterViewModel.currentCharacter?.equipment.armor)
                
                Spacer()
                
                equipmentItemView(title: "Attack", card: characterViewModel.currentCharacter?.equipment.attack)
                
                Spacer()
                
                equipmentItemView(title: "Shield", card: characterViewModel.currentCharacter?.equipment.shield)
            }
        }
    }
    
    @ViewBuilder
    func equipmentItemView(title: String, card: ItemCardModel?) -> some View {
        VStack(spacing: 0) {
            if card != nil {
                ItemCard(card: card!, size: .medium)
                    .padding(.bottom,10)
            } else {
                Color.clear
                    .frame(width: 95, height: 130)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(style: .init(dash: [3]))
                            .foregroundStyle(.appPrimary2)
                    }
                    .padding(.bottom,10)
            }
            
            Text(title)
                .font(.custom("MontserratRoman-Semibold", size: 16))
                .foregroundStyle(.appThirty2)
        }
    }
    
    func typesView() -> some View {
        return VStack(spacing: 0) {
            ForEach(listOfView.indices, id: \.self) { index in
                       listOfView[index]
                   }
        }
    }
    
    @ViewBuilder
    func cardTypeView(type: ItemType, arrayOfCards: Array<(Int, ItemCardModel)>) -> some View {
        VStack(spacing: 0) {
            Text(type.rawValue)
                .font(.custom("MontserratRoman-Semibold", size: 20))
                .foregroundStyle(.appThirty2)
                .padding(.bottom, 10)
            
            Divider()
                .padding(.horizontal)
                .padding(.bottom, 14)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                ForEach(arrayOfCards, id: \.self.1) { (count, card) in
                    ItemCard(card: card, size: .medium, count: count)
                    .padding(.bottom, 36)
                }
            }
        }
    }
    
    func getInitData() {
        dPrint("TAKE INIT LIST OF CARDS")
        
        var arrayOfCards: Array<(Int, ItemCardModel)> = []
        
        let arrayOfId = Array(characterViewModel.currentCharacter!.inventory)
        
        for item in arrayOfId {
            let card = CardStorage.allCards.first { card in
                card.id == item.key
            }
            
            arrayOfCards.append((item.value, card!))
        }
        
        for type in ItemType.allCases {
            let filtredCards = arrayOfCards.filter({ (count, card) in
                card.type == type
            })
            
            if !filtredCards.isEmpty {
                listOfView.append(AnyView(cardTypeView(type: type, arrayOfCards: filtredCards)))
            }
        }
    }
}

#Preview {
    InventoryView()
}
