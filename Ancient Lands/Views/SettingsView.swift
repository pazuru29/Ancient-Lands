//
//  SettingsView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    @State var isCharacterDetailShowed = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    Button {
                        //TODO: -
                    } label: {
                        HStack(spacing: 0) {
                            Text("🇺🇸")
                                .frame(width: 24)
                                .padding(.trailing, 8)
                            
                            Text("Language")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom)
                    
                    NavigationLink {
                        //TODO: -
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .frame(width: 24)
                                .padding(.trailing, 8)
                            
                            Text("Сhange character")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom)
                    
                    Button {
                        //TODO: -
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "list.bullet.clipboard")
                                .frame(width: 24)
                                .padding(.trailing, 8)
                            
                            Text("Rules")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom)
                    
                    Button {
                        //TODO: -
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "info.circle")
                                .frame(width: 24)
                                .padding(.trailing, 8)
                            
                            Text("About the app")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(MainButtonStyle())

                }
                .padding(.top, 88)
                .padding(.horizontal)
                .padding(.bottom, 36)
            }
            
            VStack {
                AppSecondaryBar(title: "Settings") {
                    SmallCharacterCard(character: characterViewModel.currentCharacter!.type.getCharacteristic())
                        .onTapGesture {
                            withAnimation {
                                isCharacterDetailShowed = true
                            }
                        }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .background(.appPrimary)
        .overlay {
            if isCharacterDetailShowed {
                CharacterDetailView(isShowed: $isCharacterDetailShowed, character: characterViewModel.currentCharacter!.type.getCharacteristic())
            }
        }
    }
}

#Preview {
    SettingsView()
}
