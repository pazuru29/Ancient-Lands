//
//  GameView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 22.03.2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var isDetailShowed: Bool = false
    
    @State var isInventoryShowed: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                //TODO: -
            }
            
            VStack {
                GameAppBar(currentCharacter: characterViewModel.currentCharacter!, isDetailShowed: $isDetailShowed, isInventoryShowed: $isInventoryShowed)
                Spacer()
            }
        }
        .overlay {
            if isDetailShowed {
                CharacterDetailView(isShowed: $isDetailShowed, character: characterViewModel.currentCharacter!.type.getCharacteristic())
            }
        }
        .sheet(isPresented: $isInventoryShowed, content: {
            ZStack {
                Color.appPrimary.opacity(0.8)
                    .ignoresSafeArea()
                InventoryView()
            }
            .presentationDetents([.medium, .large])
            .presentationBackground(.ultraThinMaterial)
        })
        .background(.appPrimary)
    }
}

#Preview {
    GameView()
}
