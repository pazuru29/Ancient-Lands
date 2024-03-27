//
//  MainView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @State var isNeedNewGameCreatedAlertOpen: Bool = false
    
    @State var isCharacterDetailShowed = false
    
    @State var hasActiveGame = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    logoView()
                        .padding(.bottom, 88)
                    
                    Button("Cintinue") {
                        navigationManager.addView(.game)
                    }
                    .disabled(!hasActiveGame)
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 16)
                    
                    Button("Start new game") {
                        if !hasActiveGame {
                            gameViewModel.startNewGame()
                            navigationManager.addView(.game)
                        } else {
                            isNeedNewGameCreatedAlertOpen.toggle()
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 16)
                    
                    Button("Settings") {
                        navigationManager.addView(.settings)
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 48)
                .padding(.top, 152)
                .padding(.bottom, 36)
            }
            .scrollIndicators(.hidden)
            
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
        .alert("Do you really want to create a new game? All previous data will be deleted.", isPresented: $isNeedNewGameCreatedAlertOpen) {
            Button("Create", role: .destructive) {
                gameViewModel.startNewGame()
                navigationManager.addView(.game)
            }
            
            Button("Cancel", role: .cancel) {
                isNeedNewGameCreatedAlertOpen = false
            }
        }
        .task {
            hasActiveGame = CoreDataManager.shared.getSavedGame() != nil
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
