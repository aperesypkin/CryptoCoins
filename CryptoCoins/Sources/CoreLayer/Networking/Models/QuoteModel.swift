//
//  QuoteModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct QuoteModel {
    let price: Double
    let volume24h: Double
    let percentChange1h: Double
    let percentChange24h: Double
    let percentChange7d: Double
    let marketCap: Double
    let lastUpdated: Date
}

extension QuoteModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case price
        case volume24h = "volume_24h"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
}
