//
//  BackCardSet.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct BackCardSet: View {
    var body: some View {
        ZStack {
            BackOfCard()
                .rotationEffect(Angle.degrees(-34))
                .offset(x: -68, y: 16)
            BackOfCard()
                .rotationEffect(Angle.degrees(-17))
                .offset(x: -34, y: 2)
            BackOfCard()
                .rotationEffect(Angle.degrees(0))
                .offset(x: 0, y: 0)
            BackOfCard()
                .rotationEffect(Angle.degrees(17))
                .offset(x: 34, y: 4)
            BackOfCard()
                .rotationEffect(Angle.degrees(34))
                .offset(x: 68, y: 16)
        }
    }
}

#Preview {
    BackCardSet()
}
