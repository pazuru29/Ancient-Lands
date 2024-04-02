//
//  Text+Extension.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import Foundation
import SwiftUI

extension Text {
    func appSemiBlodFont(size: CGFloat) -> Text {
        self.font(.custom("MontserratRoman-SemiBold", size: size))
    }
    
    func appMediumFont(size: CGFloat) -> Text {
        self.font(.custom("MontserratRoman-Medium", size: size))
    }
    
    func appRegularFont(size: CGFloat) -> Text {
        self.font(.custom("MontserratRoman-Regular", size: size))
    }
    
    func appMedievalSharpFont(size: CGFloat) -> Text {
        self.font(.custom("MedievalSharp", size: size))
    }
}
