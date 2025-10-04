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
    
    @Published var searchText: String = ""
    
    private let dataServiice = CoinDataService()
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.allCoins.append(CoinModel.dev.coin)
//            self.portfolioCoins.append(CoinModel.dev.coin)
//        }
        
        addSubscribers()
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataServiice.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
            guard !text.isEmpty else {
                return coins
            }
            
            let lowercasedText = text.lowercased()
            
            return coins.filter { (coin) -> Bool in
                return coin.name.lowercased().contains(lowercasedText) ||
                        coin.symbol.lowercased().contains(lowercasedText) ||
                        coin.id.lowercased().contains(lowercasedText)
            }
        }
}
