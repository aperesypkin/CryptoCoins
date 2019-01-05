//
//  ILatestCryptocurrenciesService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ILatestCryptocurrenciesService {
    func loadLatestCryptocurrencies(completion: @escaping (Result<[LatestCryptocurrencyModel]>) -> Void)
}
