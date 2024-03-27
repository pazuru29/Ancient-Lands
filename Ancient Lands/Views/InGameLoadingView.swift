//
//  InGameLoadingView.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 26.03.2024.
//

import SwiftUI

struct InGameLoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ProgressView()
                .foregroundStyle(.appThirty2)
            
            Spacer()
        }
    }
}

#Preview {
    InGameLoadingView()
}
