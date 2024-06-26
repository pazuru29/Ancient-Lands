//
//  MainButtonStyle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .appSemiBlodFont(size: 18)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(getBackground(isPressed: configuration.isPressed))
            .foregroundStyle(getTextForeground(isPressed: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: isEnabled ? .black.opacity(0.3) : .clear, radius: 4, y: 4)
            .animation(.easeIn, value: isEnabled)
    }
    
    func getBackground(isPressed: Bool) -> Color {
        guard isEnabled else {
            return .appPrimary2.opacity(0.5)
        }
        return isPressed ? .appSecondary2 : .appPrimary2
    }
    
    func getTextForeground(isPressed: Bool) -> Color {
        guard isEnabled else {
            return .appPrimary.opacity(0.5)
        }
        return isPressed ? .appSecondary : .appPrimary
    }
}

#Preview {
    Button("ddd") {
        
    }
    .buttonStyle(MainButtonStyle())
}
