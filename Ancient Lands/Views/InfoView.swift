//
//  InfoView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Terms of Service")
                        .appSemiBlodFont(size: 20)
                        .foregroundStyle(.appSecondary2)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    Text(SettingsStorage.termsOfService)
                        .appRegularFont(size: 16)
                        .foregroundStyle(.appThirty2)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 48)
                    
                    Text("Privacy Policy")
                        .appSemiBlodFont(size: 20)
                        .foregroundStyle(.appSecondary2)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    Text(SettingsStorage.privacyPolicy)
                        .appRegularFont(size: 16)
                        .foregroundStyle(.appThirty2)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                .padding(.top, 80)
                .padding(.bottom, 36)
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                AppSecondaryBar(title: "About the app") {}
                
                Spacer()
            }
        }
    }
}

#Preview {
    InfoView()
}
