//
//  Ancient_LandsApp.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 15.03.2024.
//

import SwiftUI

@main
struct Ancient_LandsApp: App {
    @StateObject var characterViewModel: CharacterViewModel = CharacterViewModel()
    
    @StateObject var gameViewModel: GameViewModel = GameViewModel()
    
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
                        NavigationView {
                            ChooseCharacter()
                        }
                    } else {
                        NavigationView {
                            MainView()
                        }
                    }
                }
            }
            
            if !navigationManager.path.isEmpty {
                navigationManager.path.last!.getView()
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            mainContent
                .preferredColorScheme(.dark)
                .background(.appPrimary)
                .environmentObject(navigationManager)
                .environmentObject(characterViewModel)
                .environmentObject(gameViewModel)
        }
    }
}
