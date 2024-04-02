//
//  RulesView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import SwiftUI

struct RulesView: View {
    @AppConfiguration(\.isFirstTime) var isFirstTime
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    let isSecondary: Bool
    
    @State var currentId: Int? = 0
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ScrollViewReader { proxy in
                    VStack(spacing: 0) {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 16) {
                                ForEach(SettingsStorage.rules.indices, id: \.self) { index in
                                    VStack(spacing: 0) {
                                        Image(SettingsStorage.rules[index].0)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.appThirty2, lineWidth: 2)
                                            }
                                            .padding(.bottom, 24)
                                        
                                        Text(SettingsStorage.rules[index].1)
                                            .appRegularFont(size: 16)
                                            .foregroundStyle(.appThirty2)
                                            .multilineTextAlignment(.center)
                                            .frame(height: reader.size.height / 4)
                                    }
                                    .frame(width: reader.size.width - 32)
                                    .id(index)
                                }
                            }
                            .scrollTargetLayout()
                            .padding(.horizontal)
                        }
                        .scrollPosition(id: $currentId)
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        .padding(.top, 80)
                        .padding(.bottom, 36)
                        
                        if currentId != nil && currentId! < (SettingsStorage.rules.count - 1) {
                            Button("Next") {
                                if let current = currentId {
                                    withAnimation {
                                        proxy.scrollTo(current + 1, anchor: .center)
                                        currentId! += 1
                                    }
                                }
                            }
                            .buttonStyle(MainButtonStyle())
                            .padding(.horizontal, 24)
                            .padding(.bottom, 36)
                        }
                        
                        if currentId == (SettingsStorage.rules.count - 1) {
                            Button("Continue") {
                                if isFirstTime {
                                    isFirstTime = false
                                }
                                navigationManager.removeLast()
                            }
                            .buttonStyle(MainButtonStyle())
                            .padding(.horizontal, 24)
                            .padding(.bottom, 36)
                        }
                    }
                }
                
                VStack {
                    if isSecondary {
                        AppSecondaryBar(title: "Rules") {}
                    } else {
                        AppBar(title: "Rules") {}
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
