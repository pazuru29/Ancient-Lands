//
//  BackOfCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct BackOfCard: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("dragon")
                .resizable()
                .scaledToFit()
                .frame(width: 54)
                .padding(.bottom, 14)
            
            Text("Ancient Lands:\nCard Adventures")
                .appMedievalSharpFont(size: 9)
                .foregroundStyle(.appPrimary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 14)
        .padding(.top, 16)
        .padding(.bottom, 20)
        .background(.appPrimary2)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4, x: -2, y: 4)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.appThirty2 ,lineWidth: 6)
        }
    }
}

#Preview {
    BackOfCard()
}
