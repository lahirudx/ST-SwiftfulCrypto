//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-10-01.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                centerColumn
            }
            
            rightColumn
            
        }
        .font(.subheadline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: CoinModel.dev.coin, showHoldingsColumn: true)
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: CoinModel.dev.coin, showHoldingsColumn: true)
        .preferredColorScheme(.dark)
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.scSecondaryText)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.scAccent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(.scAccent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(.scAccent)
            
            Text((coin.priceChangePercentage24HInCurrency ?? 0).asPercentString())
                .foregroundStyle(
                    (coin.priceChangePercentage24HInCurrency ?? 0) >= 0 ? .scGreen : .scRed
                )
           
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
