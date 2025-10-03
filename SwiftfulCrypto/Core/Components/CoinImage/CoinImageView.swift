//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-10-03.
//

import SwiftUI
import Combine

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                if vm.isLoading {
                    ProgressView()
                } else {
                    Image(systemName: "questionmark")
                        .foregroundStyle(.scSecondaryText)
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(coin: CoinModel.dev.coin)
        .padding()
    
}
