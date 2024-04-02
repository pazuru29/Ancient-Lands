//
//  LanguageButtonStyle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

struct LanguageButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .appSemiBlodFont(size: 18)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .foregroundStyle(getTextForeground(isPressed: configuration.isPressed))
            .contentShape(Rectangle())
            .animation(.easeIn, value: isEnabled)
    }
    
    func getTextForeground(isPressed: Bool) -> Color {
        guard isEnabled else {
            return .appPrimary2.opacity(0.5)
        }
        return isPressed ? .appThirty2 : .appPrimary2
    }
}
