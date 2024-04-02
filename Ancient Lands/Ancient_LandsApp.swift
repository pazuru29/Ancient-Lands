//
//  Ancient_LandsApp.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 15.03.2024.
//

import SwiftUI

@main
struct Ancient_LandsApp: App {
    @AppConfiguration(\.isFirstTime) var isFirstTime
    
    @StateObject var characterViewModel: CharacterViewModel = CharacterViewModel.shared
    
    @StateObject var gameViewModel: GameViewModel = GameViewModel.shared
    
    @StateObject var navigationManager: NavigationManager = NavigationManager.shared
    
    @State var isLoading: Bool = true
    
    @ViewBuilder
    var mainContent: some View {
        ZStack {
            if navigationManager.path.isEmpty {
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else {
                    if characterViewModel.currentCharacter == nil {
                        ChooseCharacter()
                    } else {
                        MainView()
                    }
                }
            }
            
            if !navigationManager.path.isEmpty {
                navigationManager.path.last!.getView()
            }
        }
        .onAppear() {
            if isFirstTime {
                navigationManager.addView(.rules(isSecondary: false))
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            mainContent
                .background(.appPrimary)
                .preferredColorScheme(.dark)
                .environmentObject(navigationManager)
                .environmentObject(characterViewModel)
                .environmentObject(gameViewModel)
        }
    }
}
