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
            .containerShape(Rectangle())
            .foregroundStyle(getForeground(isPressed: configuration.isPressed))
            .animation(.easeIn, value: isEnabled)
    }
    
    func getForeground(isPressed: Bool) -> Color {
        guard isEnabled else {
            return .appPrimary2.opacity(0.5)
        }
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
