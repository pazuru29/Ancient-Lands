//
//  CharacterCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct CharacterCard: View {
    let character: TypeOfCharacterStruct
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(character.assetName)
                .resizable()
                .scaledToFit()
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                .overlay(content: {
                    UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                        .stroke(isSelected ? .appThirty2 : .appPrimary, lineWidth: 1)
                })
                .padding([.top, .horizontal], 12)
                .padding(.bottom, 6)
            
            Text(character.name)
                .appMediumFont(size: 18)
                .foregroundStyle(isSelected ? .appPrimary : .appPrimary2)
                .frame(maxWidth: .infinity)
                .frame(height: 57)
                .background(isSelected ? .appThirty2 : .appPrimary)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
                .padding([.bottom, .horizontal], 12)
        }
        .background(isSelected ? .appPrimary2 : .appSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? .appThirty2 : .appPrimary, lineWidth: 1)
        })
        .shadow(color: isSelected ? Color.black : Color.clear, radius: 4, y: 4)
    }
}

#Preview {
    HStack {
        CharacterCard(character: TypeOfCharacter.elf.getCharacteristic(), isSelected: false)
        CharacterCard(character: TypeOfCharacter.elfWm.getCharacteristic(), isSelected: true)
    }
    .padding()
}
