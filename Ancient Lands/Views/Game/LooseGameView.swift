//
//  LooseGameView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 01.04.2024.
//

import SwiftUI

struct LooseGameView: View {
    var body: some View {
        ConstantOverlayView {
            VStack(spacing: 0) {
                Text("You have fallen in battle among the best. I'm sure you'll be much stronger in your next revivals!")
                    .font(.custom("MontserratRoman-SemiBold", size: 18))
                    .foregroundStyle(.appSecondary2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                Text("Locations traveled: \(GameViewModel.shared.currentGame.countOfLocations)")
                    .font(.custom("MontserratRoman-SemiBold", size: 16))
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                Text("Enemies defeated: \(GameViewModel.shared.currentGame.countOfDefeatedEnemy)")
                    .font(.custom("MontserratRoman-SemiBold", size: 16))
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                Text("Bosses defeated: \(GameViewModel.shared.currentGame.countOfDefeatedBosses)")
                    .font(.custom("MontserratRoman-SemiBold", size: 16))
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                Button("Menu") {
                    GameViewModel.shared.looseGame()
                }
                .buttonStyle(MainButtonStyle())
            }
            .padding(24)
            .background(.appSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.appThirty, lineWidth: 2)
            })
            .padding(.horizontal, 24)
            .padding(.vertical, 48)
        }
    }
}

#Preview {
    LooseGameView()
}
