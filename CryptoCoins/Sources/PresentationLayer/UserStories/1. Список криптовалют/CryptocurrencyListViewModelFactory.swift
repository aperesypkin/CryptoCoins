//
//  CryptocurrencyListViewModelFactory.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 01/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class CryptocurrencyListViewModelFactory {
    
    func createViewModel(quotes: [String: QuoteModel],
                         metadata: CryptocurrencyMetadataModel) -> CryptocurrencyListViewModel {
        let price: String?
        let percentChange: String?
        
        if let quote = quotes["USD"] {
            price = "\(quote.price.rounded(toPlaces: 2)) $"
            percentChange = "\(quote.percentChange1h.rounded(toPlaces: 1)) %"
        } else {
            price = nil
            percentChange = nil
        }
        
        return CryptocurrencyListViewModel(image: metadata.logo.size(of: .size200) ?? metadata.logo,
                                           name: metadata.name,
                                           symbol: metadata.symbol,
                                           price: price,
                                           percentChange: percentChange)
    }
    
}
