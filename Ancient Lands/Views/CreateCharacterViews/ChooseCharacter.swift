//
//  ChooseCharacter.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct ChooseCharacter: View {
    @State var selectedCharacter: TypeOfCharacter?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(TypeOfCharacter.allCases, id: \.self) { character in
                            CharacterCard(character: character.getCharacteristic(), isSelected: selectedCharacter == character)
                                .onTapGesture {
                                    withAnimation {
                                        if selectedCharacter == character {
                                            selectedCharacter = nil
                                        } else {
                                            selectedCharacter = character
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.bottom, 36)
                    
                    Button("Cintinue") {
                        //TODO: continue
                    }
                    .disabled(selectedCharacter == nil)
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.top, 80)
                .padding(.bottom, 36)
                .padding(.horizontal, 16)
            }
            .background(.appPrimary)
            
            VStack {
                AppBar(title: "Choose a character")
                Spacer()
            }
        }
    }
}

#Preview {
    ChooseCharacter()
}
