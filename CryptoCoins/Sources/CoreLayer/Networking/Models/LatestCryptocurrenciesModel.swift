//
//  LatestCryptocurrenciesModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 28/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

/// https://coinmarketcap.com/api/documentation/v1/#operation/getV1CryptocurrencyListingsLatest
struct LatestCryptocurrenciesModel {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let cmcRank: Int
    let numMarketPairs: Int
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Int?
    let tags: [String]
    let quote: [String: QuoteModel]
}

extension LatestCryptocurrenciesModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug, tags, quote
        case cmcRank = "cmc_rank"
        case numMarketPairs = "num_market_pairs"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
    }
}
