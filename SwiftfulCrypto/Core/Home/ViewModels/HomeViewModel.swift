//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-10-02.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(CoinModel.dev.coin)
            self.portfolioCoins.append(CoinModel.dev.coin)
        }
    }
}
