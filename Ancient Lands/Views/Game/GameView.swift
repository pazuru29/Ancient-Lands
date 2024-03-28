//
//  GameView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 22.03.2024.
//

import SwiftUI
import ToastUI

struct GameView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @State var isDetailShowed: Bool = false
    
    @State var isInventoryShowed: Bool = false
    
    var body: some View {
        ZStack {
            if gameViewModel.gameState == .loading {
                InGameLoadingView()
            } else {
                if gameViewModel.currentGame.currentBattle != nil {
                    BattleView()
                } else {
                    LevelView()
                }
            }
            
            VStack {
                GameAppBar(currentCharacter: characterViewModel.currentCharacter!, isDetailShowed: $isDetailShowed, isInventoryShowed: $isInventoryShowed)
                Spacer()
            }
        }
        .background(.appPrimary)
        .toast(isPresented: $isDetailShowed, content: {
            CharacterDetailView(isShowed: $isDetailShowed, character: characterViewModel.currentCharacter!.character)
        })
        .toast(isPresented: $gameViewModel.isImproveToastOpen, dismissAfter: 2, content: {
            OverlayView(isShowed: $gameViewModel.isImproveToastOpen) {
                Text(gameViewModel.improveToastText)
                    .font(.custom("MontserratRoman-SemiBold", size: 24))
                    .foregroundStyle(.appPrimary2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }
        })
        .sheet(isPresented: $isInventoryShowed, content: {
            ZStack {
                Color.appPrimary.opacity(0.8)
                    .ignoresSafeArea()
                InventoryView()
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
            .presentationBackground(.ultraThinMaterial)
        })
    }
}

#Preview {
    GameView()
}