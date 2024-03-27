//
//  GameCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(spacing: 0) {
                    Text(gameViewModel.currentGame.supplement?.story ?? gameViewModel.currentGame.currentLocation.story)
                        .font(.custom("MontserratRoman-Medium", size: 14))
                        .foregroundStyle(.appPrimary2)
                        .multilineTextAlignment(.center)
                        .frame(height: reader.size.height / 5)
                        .padding(.top, 16)
                        .padding(.bottom, 10)
                    
                    GameCardSet(assetName: gameViewModel.currentGame.supplement?.assetName ?? gameViewModel.currentGame.currentLocation.assetName, name: gameViewModel.currentGame.supplement?.name ?? gameViewModel.currentGame.currentLocation.name, inLoading: gameViewModel.gameState == .inGameLoading)
                        .padding(.bottom, 48)
                    
                    VStack(spacing: 0) {
                        if gameViewModel.currentGame.supplement == nil {
                            ForEach(gameViewModel.currentGame.currentLocation.actions.filter({ action in
                                !gameViewModel.currentGame.usedActions.contains(action)
                            }), id: \.self) { action in
                                Button(action.rawValue) {
                                    //TODO: -
                                    gameViewModel.makeAction(action: action)
                                }
                                .buttonStyle(MainButtonStyle())
                                .padding(.bottom, 12)
                            }
                        } else {
                            ForEach(gameViewModel.currentGame.supplement!.actions.filter({ action in
                                !gameViewModel.currentGame.usedSupplementActions.contains(action)
                            }), id: \.self) { action in
                                Button(action.rawValue) {
                                    //TODO: -
                                    gameViewModel.makeAction(action: action)
                                }
                                .buttonStyle(MainButtonStyle())
                                .padding(.bottom, 12)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 68)
                .padding(.bottom, 24)
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}
