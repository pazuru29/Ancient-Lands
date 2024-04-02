//
//  ChooseCharacter.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI
import ToastUI

struct ChooseCharacter: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    var isSecondary: Bool = false
    
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
                    
                    Button("Continue") {
                        if let selectedCharacter = selectedCharacter {
                            characterViewModel.selectedCharacter = selectedCharacter
                            
                            navigationManager.addView(.pickCardSet)
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
                if !isSecondary {
                    AppBar(title: "Choose a character") {}
                } else {
                    AppSecondaryBar(title: "Choose a character") {}
                }
                Spacer()
            }
        }
        .toast(isPresented: $isCharacterDetailShowed, content: {
            CharacterDetailView(isShowed: $isCharacterDetailShowed, character: overlayCharacter.getCharacteristic())
        })
    }
}

#Preview {
    ChooseCharacter()
}
