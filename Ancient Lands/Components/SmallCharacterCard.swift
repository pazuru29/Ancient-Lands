//
//  SmallCharacterCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct SmallCharacterCard: View {
    let character: TypeOfCharacterStruct
    
    var name: String? = nil
    
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
                .padding(.trailing, name != nil ? 8 : 0)
            
            if let name = name {
                Text(name)
                    .appMediumFont(size: 14)
                    .foregroundStyle(.appPrimary2)
            }
            
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    SmallCharacterCard(character: TypeOfCharacter.elfWm.getCharacteristic())
}
