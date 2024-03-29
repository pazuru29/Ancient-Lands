//
//  HpProgressViewStyle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 29.03.2024.
//

import Foundation
import SwiftUI

struct HpProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { reader in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: reader.size.width * CGFloat(configuration.fractionCompleted ?? 0), height: 16)
                    .foregroundColor(.appRed)
                
                RoundedRectangle(cornerRadius: 100)
                    .frame(height: 16)
                    .foregroundColor(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(.appThirty2 ,lineWidth: 2)
                    }
            }
        }
    }
}
