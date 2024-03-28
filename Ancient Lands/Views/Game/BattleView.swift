//
//  BattleView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

struct BattleView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            Button("ATTACK") {
                gameViewModel.testEndBattle()
            }
                .buttonStyle(MainButtonStyle())
        }
    }
}

#Preview {
    BattleView()
}
