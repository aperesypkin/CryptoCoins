//
//  CryptocurrencyMetadataModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 01/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct CryptocurrencyMetadataModel {
    let id: Int
    let name: String
    let symbol: String
    let category: String
    let slug: String
    let logo: URL
    let tags: [String]?
    let urls: CryptocurrencyLinksModel
}

extension CryptocurrencyMetadataModel: Decodable {}
