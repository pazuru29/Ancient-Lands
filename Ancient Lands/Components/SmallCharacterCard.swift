//
//  SmallCharacterCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct SmallCharacterCard: View {
    let character: TypeOfCharacterStruct
    
    var body: some View {
        HStack(spacing: 0) {
            Image(character.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .overlay(content: {
                    Circle()
                        .stroke(.appPrimary2, lineWidth: 1)
                })
                .padding(.trailing, 8)
            
            VStack(alignment: .leading ,spacing: 0) {
                Text("Race")
                    .font(.custom("MontserratRoman-Semibold", size: 14))
                    .foregroundStyle(.appPrimary2)
                    .padding(.bottom, 4)
                Text(character.name)
                    .font(.custom("MontserratRoman-Regular", size: 14))
                    .foregroundStyle(.appPrimary2)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    SmallCharacterCard(character: TypeOfCharacter.elfWm.getCharacteristic())
}
