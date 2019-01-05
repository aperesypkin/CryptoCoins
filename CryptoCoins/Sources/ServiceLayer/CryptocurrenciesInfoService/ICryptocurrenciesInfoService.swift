//
//  ICryptocurrenciesInfoService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 01/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrenciesInfoService {
    func loadCryptocurrenciesInfo(for identifiers: [Int], completion: @escaping (Result<[String: CryptocurrencyMetadataModel]>) -> Void)
}
