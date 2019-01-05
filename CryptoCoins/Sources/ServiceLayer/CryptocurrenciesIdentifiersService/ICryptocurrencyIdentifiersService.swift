//
//  ICryptocurrenciesIdentifiersService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrenciesIdentifiersService {
    func loadCryptocurrenciesIdentifiers(completion: @escaping (Result<[CryptocurrencyIdentifiersModel]>) -> Void)
}
