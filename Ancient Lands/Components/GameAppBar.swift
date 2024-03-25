//
//  GameAppBar.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 22.03.2024.
//

import SwiftUI

struct GameAppBar: View {
    var currentCharacter: Character
    
    @Binding var isDetailShowed: Bool
    
    @Binding var isInventoryShowed: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    NavigationManager.shared.removeLast()
                }, label: {
                    Image(systemName: "chevron.left")
                })
                .buttonStyle(IconButtonStyle())
                
                SmallCharacterCard(character: currentCharacter.type.getCharacteristic(), name: currentCharacter.name)
                    .onTapGesture {
                        withAnimation {
                            isDetailShowed.toggle()
                        }
                    }
                    .padding(.trailing, 24)
                
                Spacer()
                
                Button {
                    withAnimation {
                        isInventoryShowed.toggle()
                    }
                } label: {
                    Image("inventory")
                        .resizable()
                        .scaledToFit()
                }
                .buttonStyle(IconButtonStyle())
                
            }
            .padding(.trailing)
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            .background(.appPrimary.opacity(0.85))
            .background(.ultraThinMaterial.opacity(0.95))
            
            Divider()
                .background(.appThirty)
        }
    }
}
