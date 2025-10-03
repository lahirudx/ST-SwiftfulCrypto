//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-10-03.
//

import Foundation
import UIKit
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        getCoinImage(coin: coin)
    }
    
    private func getCoinImage(coin: CoinModel) {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ UIImage(data: $0)} )
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
