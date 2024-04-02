//
//  BattleView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI
import ToastUI

struct BattleView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    let testCard: ItemCardModel = ItemCardModel(id: 0, assetName: "dragon", name: "Name", description: "", type: .shield)
    
    var body: some View {
        GeometryReader { reader in
            VStack(spacing: 0) {
                enemyView()
                    .padding(.bottom, 16)
                
                Spacer()
                
                HStack(spacing: getSpacing(reader: reader)) {
                    ForEach(gameViewModel.currentGame.currentBattle?.currentPlayCards ?? [], id: \.id) { card in
                        ItemCard(card: card, size: .medium)
                    }
                }
                .padding(.bottom, 16)
                
                Spacer()
                
                playerView()
            }
            .padding(.top, 80)
            .padding(.bottom)
            .padding(.horizontal, 16)
            .sheet(isPresented: $gameViewModel.isBattleItemsOpen) {
                ZStack {
                    Color.appPrimary.opacity(0.8)
                        .ignoresSafeArea()
                    ChooseBattleCardView(isOpen: $gameViewModel.isBattleItemsOpen)
                }
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
                .presentationBackground(.ultraThinMaterial)
            }
        }
        .toast(isPresented: $gameViewModel.isGameLoose, content: {
            LooseGameView()
        })
    }
    
    func playerView() -> some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Spacer()
                
                ForEach(gameViewModel.currentGame.currentBattle?.playerEffects ?? [], id: \.self) { effect in
                    HStack(alignment: .bottom, spacing: 0) {
                        Image(effect.assetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .padding(.trailing, 4)
                        
                        Text("X \(effect.countOfRounds)")
                            .appMediumFont(size: 12)
                            .foregroundStyle(.appThirty2)
                    }
                }
            }
            .frame(height: 36)
            
            HStack(spacing: 0) {
                Image("hpLight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .padding(.trailing, 8)
                
                ProgressView(value: Double(gameViewModel.currentGame.currentBattle?.currentPlayerHp ?? 0), total: Double(characterViewModel.currentCharacter?.character.hp ?? 100))
                    .progressViewStyle(HpProgressViewStyle())
                    .frame(height: 16)
            }
            .padding(.bottom, 12)
            
            HStack(spacing: 0) {
                Button(gameViewModel.currentGame.currentBattle?.step == .enemy ? "Defense" : "Attack") {
                    if gameViewModel.currentGame.currentBattle?.step == .enemy {
                        gameViewModel.defenseFromEnemy()
                    } else {
                        gameViewModel.attackEnemy()
                    }
                }
                .buttonStyle(MainButtonStyle())
                .padding(.trailing, gameViewModel.countOfEscapeFromBattle < 3 ? 24 : 0)
                
                if gameViewModel.countOfEscapeFromBattle < 3 {
                    Button(action: {
                        gameViewModel.escapeFromBattle()
                    }, label: {
                        Image("run")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                    })
                    .buttonStyle(IconButtonStyle())
                }
            }
            .padding(.bottom, 16)
            
            HStack {
                Button {
                    gameViewModel.openBattleItemsSheet(typeOfButton: .attack)
                } label: {
                    Image("attack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(GameButtonStyle())
                .disabled(gameViewModel.currentGame.currentBattle?.step == .enemy)
                
                Button {
                    gameViewModel.openBattleItemsSheet(typeOfButton: .defense)
                } label: {
                    Image("defense")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(GameButtonStyle())
                .disabled(gameViewModel.currentGame.currentBattle?.step == .player)
                
                Button {
                    gameViewModel.openBattleItemsSheet(typeOfButton: .potion)
                } label: {
                    Image("potion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(GameButtonStyle())
            }
            
        }
    }
    
    @ViewBuilder
    func enemyView() -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(gameViewModel.currentGame.currentBattle?.enemy.assetName ?? "dragon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.appThirty2, lineWidth: 2)
                    }
                    .padding(.trailing, 16)
                
                Text(gameViewModel.currentGame.currentBattle?.enemy.name ?? "Name")
                    .appSemiBlodFont(size: 20)
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack(spacing: 0) {
                Image(.hpLight)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .padding(.trailing, 8)
                
                ProgressView(value: Double(gameViewModel.currentGame.currentBattle?.currentEnemyHp ?? 0), total: Double(gameViewModel.currentGame.currentBattle?.enemy.hp ?? 100))
                    .progressViewStyle(HpProgressViewStyle())
                    .frame(height: 16)
            }
            HStack(spacing: 8) {
                Spacer()
                
                ForEach(gameViewModel.currentGame.currentBattle?.enemy.debuffs ?? [], id: \.self) { effect in
                    HStack(alignment: .bottom, spacing: 0) {
                        Image(effect.assetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .padding(.trailing, 4)
                        
                        Text("X \(effect.countOfRounds)")
                            .appMediumFont(size: 12)
                            .foregroundStyle(.appThirty2)
                    }
                }
            }
        }
    }
    
    func getSpacing(reader: GeometryProxy) -> CGFloat {
        let widthOfCard = CGFloat(95)
        let countOfCards = CGFloat(gameViewModel.currentGame.currentBattle?.currentPlayCards.count ?? 1)
        
        let paddingBetwenCards: CGFloat = 8
        
        let horizontalPadding: CGFloat = 32
        
        dPrint("Screen width: \(reader.size.width)")
        dPrint("Cards width: \((countOfCards * widthOfCard))")
        
        let widthAllCards = (reader.size.width - (horizontalPadding + (paddingBetwenCards * (countOfCards - 1)))) - (countOfCards * widthOfCard)
        
        if widthAllCards < 0 {
            return widthAllCards / countOfCards
        } else {
            return 8
        }
    }
}

#Preview {
    BattleView()
}
