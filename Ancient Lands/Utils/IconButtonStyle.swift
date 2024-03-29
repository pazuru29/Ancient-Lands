//
//  IconButtonStyle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import SwiftUI

struct IconButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.bold)
            .frame(width: 48, height: 48)
            .contentShape(Rectangle())
            .foregroundStyle(getForeground(isPressed: configuration.isPressed))
            .opacity(isEnabled ? 1 : 0.5)
            .animation(.easeIn, value: isEnabled)
    }
    
    func getForeground(isPressed: Bool) -> Color {
        return isPressed ? .appThirty2 : .appPrimary2
    }
}

#Preview {
    Button(action: {
        
    }, label: {
        Image(systemName: "rectangle.and.pencil.and.ellipsis")
    })
    .buttonStyle(IconButtonStyle())
}
