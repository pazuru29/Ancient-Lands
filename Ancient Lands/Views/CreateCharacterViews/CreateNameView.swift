//
//  CreateName.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI
import Combine

struct CreateNameView: View, KeyboardReadable {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    let character: TypeOfCharacter
    
    let cards: TypeStartCards
    
    @State var name: String = ""
    
    let textLimit = 60
    
    @State private var isKeyboardVisible = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(character.getCharacteristic().assetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.appPrimary2, lineWidth: 1)
                            }
                            .padding(.trailing, 16)
                        
                        Spacer()
                        
                        HStack(spacing: -24) {
                            ForEach(Array(cards.getCards().keys), id: \.self) { id in
                                let card = CardStorage.allCards.first(where: { element in
                                    element.id == id
                                })
                                
                                if card == nil {
                                    BackOfCard()
                                } else {
                                    ItemCard(card: card!, isSmall: true)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 88)
                    
                    TextField(text: $name) {
                        Text("Name of character")
                            .font(.custom("MontserratRoman-Regular", size: 16))
                            .foregroundStyle(.white)
                    }
                    .font(.custom("MontserratRoman-Regular", size: 16))
                    .foregroundStyle(.white)
                    .onReceive(Just(name)) { _ in limitText(textLimit) }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.appPrimary2)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.top, 88)
            }
            
            VStack {
                AppSecondaryBar(title: "Create name") {}
                Spacer()
                if !isKeyboardVisible {
                    Button("Create") {
                        //TODO: navigate to main
                        
                        if !trim(name).isEmpty {
                            let character = Character(type: self.character, name: trim(name), equipment: Equipment(), inventory: cards.getCards())
                            
                            characterViewModel.saveNewCharacter(character: character)
                        }
                    }
                    .disabled(trim(name).isEmpty)
                    .buttonStyle(MainButtonStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 36)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onReceive(keyboardPublisher, perform: { newIsKeyboardVisible in
            print("Is keyboard visible? ", newIsKeyboardVisible)
            isKeyboardVisible = newIsKeyboardVisible
        })
        .background(.appPrimary)
    }
    
    func limitText(_ upper: Int) {
        if name.count > upper {
            name = String(name.prefix(upper))
        }
    }
    
    func trim(_ text: String) -> String {
        return text.trimmingCharacters(in: .whitespaces)
    }
}

#Preview {
    CreateNameView(character: .elf, cards: .elf)
}
