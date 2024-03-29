//
//  GameButtonStyle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 29.03.2024.
//

import Foundation
import SwiftUI

struct GameButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 64)
            .background(getBackground(isPressed: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: isEnabled ? .black.opacity(0.3) : .clear, radius: 4, y: 4)
            .opacity(isEnabled ? 1 : 0.5)
            .animation(.easeIn, value: isEnabled)
    }
    
    func getBackground(isPressed: Bool) -> Color {
        return isPressed ? .appThirty : .appSecondary
    }
}
