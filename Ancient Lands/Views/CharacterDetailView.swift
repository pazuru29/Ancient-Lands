//
//  CharacterDetailView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct CharacterDetailView: View {
    @Binding var isShowed: Bool
    
    let character: TypeOfCharacterStruct
    
    var body: some View {
        OverlayView(isShowed: $isShowed) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    Image(character.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 148, height: 148)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.appThirty2, lineWidth: 1)
                        })
                        .padding(.trailing, 8)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(character.name)
                            .font(.custom("MontserratRoman-SemiBold", size: 22))
                            .foregroundStyle(.appPrimary2)
                            .padding(.bottom, 8)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 2) {
                            statisticView(assetname: "hp", title: String(character.hp))
                            statisticView(assetname: "attack", title: String(character.attack))
                            statisticView(assetname: "defense", title: String(character.defense))
                            statisticView(assetname: "speed", title: String(character.dexterity))
                            statisticView(assetname: "stealth", title: String(character.stealth))
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Character Enhancement:")
                        .font(.custom("MontserratRoman-SemiBold", size: 16))
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 4)
                    
                    ForEach(character.characterEnhancement, id: \.self) { character in
                        Text(character)
                            .font(.custom("MontserratRoman-Regular", size: 16))
                            .foregroundStyle(.appPrimary2)
                            .padding(.bottom, 2)
                    }
                }
                .padding(.bottom, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Passive Skills:")
                        .font(.custom("MontserratRoman-SemiBold", size: 16))
                        .foregroundStyle(.appPrimary2)
                        .padding(.bottom, 4)
                    
                    ForEach(character.passiveSkills, id: \.self) { skill in
                        Text(skill)
                            .font(.custom("MontserratRoman-Regular", size: 16))
                            .foregroundStyle(.appPrimary2)
                            .padding(.bottom, 2)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(.appPrimary.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.appSecondary, lineWidth: 4)
            })
            .padding(24)
        }
    }
    
    @ViewBuilder
    func statisticView(assetname: String, title: String) -> some View {
        HStack(spacing: 0) {
            Image(assetname)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .padding(.trailing, 5)
            
            Text(String(title))
                .font(.custom("MontserratRoman-SemiBold", size: 18))
                .foregroundStyle(.appPrimary2)
        }
    }
}

#Preview {
    CharacterDetailView(isShowed: .constant(true), character: TypeOfCharacter.elf.getCharacteristic())
}
