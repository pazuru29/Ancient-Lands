//
//  ChooseCharacter.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct ChooseCharacter: View {
    @State var selectedCharacter: TypeOfCharacter?
    
    @State var isCharacterDetailShowed = false
    @State var overlayCharacter: TypeOfCharacter = .knight
    
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
                                .onLongPressGesture {
                                    overlayCharacter = character
                                    withAnimation {
                                        isCharacterDetailShowed.toggle()
                                    }
                                }
                                .sensoryFeedback(.impact, trigger: isCharacterDetailShowed) { oldValue, newValue in
                                    newValue == true
                                }
                        }
                    }
                    .padding(.bottom, 36)
                    
                    NavigationLink("Cintinue") {
                        if let selectedCharacter = selectedCharacter {
                            PickCardSet(character: selectedCharacter)
                        }
                    }
                    .disabled(selectedCharacter == nil)
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.top, 80)
                .padding(.bottom, 36)
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .background(.appPrimary)
            
            VStack {
                AppBar(title: "Choose a character")
                Spacer()
            }
        }
        .overlay {
            if isCharacterDetailShowed {
                CharacterDetailView(isShowed: $isCharacterDetailShowed, character: overlayCharacter.getCharacteristic())
            }
        }
    }
}

#Preview {
    ChooseCharacter()
}
