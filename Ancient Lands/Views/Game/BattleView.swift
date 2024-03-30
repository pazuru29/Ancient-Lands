//
//  BattleView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

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
                
                HStack(spacing: 8) {
                    ItemCard(card: testCard, size: .medium)
                    
                    ItemCard(card: testCard, size: .medium)
                    
                    Spacer()
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
    }
    
    func playerView() -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image("hpLight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .padding(.trailing, 8)
                
                ProgressView(value: 30, total: Double(characterViewModel.currentCharacter?.character.hp ?? 100))
                    .progressViewStyle(HpProgressViewStyle())
                    .frame(height: 16)
            }
            .padding(.bottom, 12)
            
            HStack(spacing: 0) {
                Button("Attack") {
                    //TODO: --
                }
                .buttonStyle(MainButtonStyle())
                .padding(.trailing, 24)
                
                Button(action: {
                    gameViewModel.testEndBattle()
                }, label: {
                    Image("run")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                })
                .buttonStyle(IconButtonStyle())
            }
            .padding(.bottom, 16)
            
            HStack {
                Button {
                    //TODO: -
                    gameViewModel.openBattleItemsSheet(title: "Attack", types: [.rangedWeapon, .ammo, .meleeWeapon, .grenade, .magicWeapon, .spell])
                } label: {
                    Image("attack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(GameButtonStyle())
                
                Button {
                    //TODO: -
                    gameViewModel.openBattleItemsSheet(title: "Defense", types: [.shield])
                } label: {
                    Image("defense")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(GameButtonStyle())
                
                Button {
                    //TODO: -
                    gameViewModel.openBattleItemsSheet(title: "Potions", types: [.potion])
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
                Image("hpLight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .padding(.trailing, 8)
                
                ProgressView(value: 10, total: Double(gameViewModel.currentGame.currentBattle?.enemy.hp ?? 100))
                    .progressViewStyle(HpProgressViewStyle())
                    .frame(height: 16)
            }
            .padding(.bottom, 16)
            
            HStack(spacing: 0) {
                Image(gameViewModel.currentGame.currentBattle?.enemy.assetName ?? "dragon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 78, height: 78)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.appThirty2, lineWidth: 2)
                    }
                    .padding(.trailing, 16)
                
                Text(gameViewModel.currentGame.currentBattle?.enemy.name ?? "Name")
                    .font(.custom("MontserratRoman-SemiBold", size: 20))
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
}

#Preview {
    BattleView()
}
