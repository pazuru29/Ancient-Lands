//
//  MainView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var isCharacterDetailShowed = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    logoView()
                        .padding(.bottom, 88)
                    
                    NavigationLink("Cintinue") {
                        //TODO: -
                    }
                    .disabled(true)
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 24)
                    
                    NavigationLink("Start new game") {
                        //TODO: -
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 24)
                    
                    NavigationLink("Settings") {
                        SettingsView()
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 48)
                .padding(.top, 152)
                .padding(.bottom, 36)
            }
            
            VStack {
                AppBar {
                    SmallCharacterCard(character: characterViewModel.currentCharacter!.type.getCharacteristic())
                        .onTapGesture {
                            withAnimation {
                                isCharacterDetailShowed = true
                            }
                        }
                }
                Spacer()
            }
        }
        .background(.appPrimary)
        .overlay {
            if isCharacterDetailShowed {
                CharacterDetailView(isShowed: $isCharacterDetailShowed, character: characterViewModel.currentCharacter!.type.getCharacteristic())
            }
        }
    }
    
    @ViewBuilder
    func logoView() -> some View {
        VStack(spacing: 0) {
            Image("dragonYellow")
                .resizable()
                .scaledToFit()
                .frame(width: 93, height: 98)
                .padding(.bottom, 20)
            
            Text("Ancient Lands:\nCard Adventures")
                .font(.custom("MedievalSharp", size: 28))
                .foregroundStyle(.appPrimary2)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    MainView()
}
