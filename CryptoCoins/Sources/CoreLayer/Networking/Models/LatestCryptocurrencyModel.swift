//
//  LatestCryptocurrencyModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 28/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct LatestCryptocurrencyModel {
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

extension LatestCryptocurrencyModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug, tags, quote
        case cmcRank = "cmc_rank"
        case numMarketPairs = "num_market_pairs"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
    }
}
