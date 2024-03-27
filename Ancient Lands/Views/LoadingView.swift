//
//  ContentView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 15.03.2024.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack {
            LottieView(lottieFile: "loading_town", speed: -1)
                .offset(CGSize(width: 0, height: 50))
            LottieView(lottieFile: "loading_dragon")
                .frame(width: 150)
            Text("Ancient Lands:\nCard Adventures")
                .font(.custom("MedievalSharp", size: 36))
                .foregroundStyle(.appPrimary2)
                .multilineTextAlignment(.center)
                .offset(CGSize(width: 0, height: 200))
        }
        .background(.appPrimary)
        .task {
            gameViewModel.getInitData()
            characterViewModel.getInitData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isLoading.toggle()
                }
            }
        }
    }
}
