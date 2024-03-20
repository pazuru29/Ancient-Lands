//
//  CreateName.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct CreateNameView: View, KeyboardReadable {
    let character: TypeOfCharacter
    
    let cards: TypeStartCards
    
    @State var name: String = ""
    
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
                            ForEach(cards.getCards(), id: \.self.1) { num, card in
                                ItemCard(card: card, isSmall: true)
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
                    NavigationLink("Create") {
                        if !name.isEmpty {
                            //TODO: - save to db and navigate to main screen
                        }
                    }
                    .disabled(name.isEmpty)
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
}

#Preview {
    CreateNameView(character: .elf, cards: .elf)
}
