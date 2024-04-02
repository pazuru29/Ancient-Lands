//
//  NavigationView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 22.03.2024.
//

import SwiftUI

enum NavigationViews: Equatable {
    case settings
    case chooseCharacter(isSecondary: Bool = false)
    case pickCardSet
    case createName
    case game
    case info
    case rules(isSecondary: Bool = false)
    
    @ViewBuilder
    func getView() -> some View {
        switch(self) {
        case .settings:
            SettingsView()
        case .chooseCharacter(let isSecondary):
            ChooseCharacter(isSecondary: isSecondary)
        case .pickCardSet:
            PickCardSet()
        case .createName:
            CreateNameView()
        case .game:
            GameView()
        case .info:
            InfoView()
        case .rules(let isSecondary):
            RulesView(isSecondary: isSecondary)
        }
    }
}
