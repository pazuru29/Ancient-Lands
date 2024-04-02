//
//  GameCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

struct GameCardSet: View {
    let assetName: String
    let name: String
    
    let inLoading: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backCard()
                .offset(y: -22)
            
            backCard()
                .offset(y: -13)
            if !inLoading {
                card()
                    .animation(.easeIn(duration: 0.5), value: inLoading)
            } else {
                Color.clear
                    .frame(width: 250, height: 342)
            }
        }
        .frame(width: 250, height: 365)
    }
    
    @ViewBuilder
    func backCard() -> some View {
        ZStack {
            Color.appPrimary2
                .frame(width: 244, height: 336)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 5, x: 0, y: -2)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.appThirty2, lineWidth: 6)
                }
            
            VStack {
                Image("dragon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, 24)
                
                Text("Ancient Lands:\nCard Adventures")
                    .appMedievalSharpFont(size: 24)
                    .foregroundStyle(.appPrimary)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func card() -> some View {
        VStack(spacing: 0) {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 215, height: 215)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                .overlay(content: {
                    UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                        .stroke(.appThirty2, lineWidth: 1)
                })
                .padding(.bottom, 8)
            
            Text(name)
                .appMediumFont(size: 16)
                .foregroundStyle(.appPrimary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 83)
                .background(.appThirty2)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
        }
        .padding(17.5)
        .background(.appPrimary2)
        .frame(width: 250, height: 342)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5, x: 0, y: -2)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.appThirty2)
        }
    }
}

#Preview {
    GameCardSet(assetName: "Elf", name: "Elf", inLoading: false)
}
