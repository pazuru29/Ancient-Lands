//
//  NavigationManager.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 22.03.2024.
//

import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var path = Array<NavigationViews>()
    
    func addView(_ view: NavigationViews) {
        guard path.last != view else {
            return
        }
        
        if path.contains(where: {$0 == view}) {
            while path.last != view {
                path.removeLast()
            }
        } else {
            path.append(view)
        }
    }
    
    func removeLast() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func removeAll() {
        path.removeAll()
    }
}
