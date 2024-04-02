//
//  SettingsView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    @State var isDialogChangeCharacterShowed = false
    
//    @State var selectedLanguage: Language = .en
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    Button  {
                        withAnimation {
                            isDialogChangeCharacterShowed.toggle()
                        }
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
                        navigationManager.addView(.rules(isSecondary: true))
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
                        navigationManager.addView(.info)
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
            .scrollIndicators(.hidden)
            
            VStack {
                AppSecondaryBar(title: "Settings", needTrailingPadding: false) {
//                    Menu {
//                        Picker("Language", selection: $selectedLanguage) {
//                            ForEach(Language.allCases, id: \.self) {
//                                Text($0.rawValue)
//                            }
//                        }
//                    } label: {
//                        Text(selectedLanguage.rawValue)
//                    }
//                    .buttonStyle(LanguageButtonStyle())
//                    .frame(width: 64)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .background(.appPrimary)
        .alert("If you change character, all current progress will be lost. Do you want to change your character?", isPresented: $isDialogChangeCharacterShowed) {
            Button("Change", role: .destructive) {
                navigationManager.addView(.chooseCharacter(isSecondary: true))
            }
            
            Button("Cancel", role: .cancel) {
                isDialogChangeCharacterShowed = false
            }
        }
    }
}

#Preview {
    SettingsView()
}
