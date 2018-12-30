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
}

extension LatestCryptocurrenciesModel: Decodable {}
