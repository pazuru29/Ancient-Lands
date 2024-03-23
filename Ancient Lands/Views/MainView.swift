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
                    
                    Button("Cintinue") {
                        //TODO: -
                    }
                    .disabled(true)
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 16)
                    
                    Button("Start new game") {
                        NavigationManager.shared.addView(.game)
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 16)
                    
                    Button("Settings") {
                        NavigationManager.shared.addView(.settings)
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
