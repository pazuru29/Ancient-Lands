//
//  ChooseBattleCardView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 29.03.2024.
//

import SwiftUI
import ToastUI

enum BattleCardType: Codable {
    case attack
    case defense
    case potion
}

struct ChooseBattleCardView: View {
    @StateObject var chooseBattleCardViewModel: ChooseBattleCardViewModel = ChooseBattleCardViewModel()
    
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Color.appThirty2
                .frame(height: 1)
                .padding(.horizontal)
                .padding(.top, 36)
            
            
            if chooseBattleCardViewModel.arrayOfCards.isEmpty {
                Spacer()
                
                Text("You do not have these items.")
                    .font(.custom("MontserratRoman-Semibold", size: 16))
                    .foregroundStyle(.appThirty2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(chooseBattleCardViewModel.arrayOfCards, id: \.self.0) { (type, array) in
                            cardTypeView(type: type, arrayOfCards: array)
                        }
                    }
                    .padding(.top, 24)
                }
                .scrollIndicators(.hidden)
            }
            
            if !chooseBattleCardViewModel.arrayOfCards.isEmpty {
                Button(gameViewModel.typeOfActiveBattleButton == .potion ? "Use" : "Select") {
                    chooseBattleCardViewModel.onSelectButtonPressed()
                    isOpen = false
                }
                .buttonStyle(MainButtonStyle())
                .disabled(!chooseBattleCardViewModel.selectButtonActive())
                .padding([.bottom, .horizontal], 24)
                .padding(.top, 8)
            }
        }
        .onAppear() {
            chooseBattleCardViewModel.getInitData()
        }
        .toast(isPresented: $chooseBattleCardViewModel.isDetailCardShowed, content: {
            CardDetailView(isShowed: $chooseBattleCardViewModel.isDetailCardShowed, card: chooseBattleCardViewModel.currentDetailCard!)
        })
        .sensoryFeedback(.impact, trigger: chooseBattleCardViewModel.isDetailCardShowed) { oldValue, newValue in
            newValue == true
        }
        .toast(isPresented: $chooseBattleCardViewModel.isWarningOpen, dismissAfter: 1) {
            VStack {
                Spacer()
                
                Text(chooseBattleCardViewModel.warningText)
                    .font(.custom("MontserratRoman-SemiBold", size: 14))
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.appLightRed)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.horizontal, .top], 24)
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func cardTypeView(type: ItemType, arrayOfCards: Array<(Int, any ItemCardModelProtocol)>) -> some View {
        VStack(spacing: 0) {
            Text(type.rawValue)
                .font(.custom("MontserratRoman-Semibold", size: 20))
                .foregroundStyle(.appThirty2)
                .padding(.bottom, 10)
            
            Color.appThirty2.opacity(0.5)
                .frame(height: 1)
                .padding(.horizontal)
                .padding(.bottom, 14)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                ForEach(arrayOfCards, id: \.self.1.id) { (count, card) in
                    ItemCard(card: card, size: .medium, count: count)
                        .overlay(content: {
                            if !chooseBattleCardViewModel.selectedCards.contains(where: { $0.id == card.id }) {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                        })
                        .padding(.bottom, 36)
                        .onTapGesture {
                            chooseBattleCardViewModel.onCardTap(card: card)
                        }
                        .onLongPressGesture(perform: {
                            dPrint("CLICK ON CARD")
                            chooseBattleCardViewModel.currentDetailCard = card
                            withAnimation {
                                chooseBattleCardViewModel.isDetailCardShowed = true
                            }
                        })
                }
            }
        }
    }
}
