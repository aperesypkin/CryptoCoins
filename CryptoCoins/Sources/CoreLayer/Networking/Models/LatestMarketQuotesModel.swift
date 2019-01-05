//
//  LatestMarketQuotesModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct LatestMarketQuotesModel {
    let quote: [String: QuoteModel]
}

extension LatestMarketQuotesModel: Decodable {}
