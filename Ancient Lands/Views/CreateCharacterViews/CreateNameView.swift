//
//  CreateName.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI
import Combine

struct CreateNameView: View, KeyboardReadable {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var name: String = ""
    
    let textLimit = 30
    
    @State private var isKeyboardVisible = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(characterViewModel.selectedCharacter.getCharacteristic().assetName)
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
                            ForEach(Array(characterViewModel.selectedCards.getCards()), id: \.self.key) { id, count in
                                let card = CardStorage.allCards.first(where: { element in
                                    element.id == id
                                })
                                
                                if card == nil {
                                    BackOfCard()
                                } else {
                                    ItemCard(card: card!, size: .small, count: count)
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
            .scrollIndicators(.hidden)
            
            VStack {
                AppSecondaryBar(title: "Create name") {}
                Spacer()
                if !isKeyboardVisible {
                    Button("Create") {
                        if !trim(name).isEmpty {
                            let character = Character(character: characterViewModel.selectedCharacter.getCharacteristic(), startCharacter: characterViewModel.selectedCharacter.getCharacteristic(), name: trim(name), equipment: Equipment(), inventory: characterViewModel.selectedCards.getCards(), startInventory: characterViewModel.selectedCards.getCards())
                            
                            characterViewModel.createNewCharacter(character: character)
                            
                            navigationManager.removeAll()
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
    CreateNameView()
}
