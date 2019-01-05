//
//  CryptocurrencyIdentifiersModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct CryptocurrencyIdentifiersModel {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
}

extension CryptocurrencyIdentifiersModel: Decodable {}
