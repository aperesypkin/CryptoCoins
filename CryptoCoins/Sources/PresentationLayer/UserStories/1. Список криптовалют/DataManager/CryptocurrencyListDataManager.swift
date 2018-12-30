//
//  CryptocurrencyListDataManager.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrencyListDataManager {
    func fetchData()
}

class CryptocurrencyListDataManager: ICryptocurrencyListDataManager {
    
    private let latestCryptocurrenciesService: ILatestCryptocurrenciesService
    
    init(latestCryptocurrenciesService: ILatestCryptocurrenciesService) {
        self.latestCryptocurrenciesService = latestCryptocurrenciesService
    }
    
    func fetchData() {
        latestCryptocurrenciesService.fetchLatestCryptocurrencies { result in
            switch result {
            case .success(let model): print(model)
            case .error(let error): print(error)
            }
        }
    }
    
}
