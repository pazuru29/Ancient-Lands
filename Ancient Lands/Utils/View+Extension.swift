//
//  View+Extension.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import Foundation
import SwiftUI

extension View {
    func appSemiBlodFont(size: CGFloat) -> some View {
        self.font(.custom("MontserratRoman-SemiBold", size: size))
    }
    
    func appRegularFont(size: CGFloat) -> some View {
        self.font(.custom("MontserratRoman-Regular", size: size))
    }
}
