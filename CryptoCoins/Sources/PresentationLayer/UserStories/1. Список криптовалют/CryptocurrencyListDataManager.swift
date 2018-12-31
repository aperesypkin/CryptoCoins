//
//  CryptocurrencyListDataManager.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrencyListDataManager {
    func loadDataSource(completion: @escaping ([LatestCryptocurrenciesModel]?) -> Void)
}

final class CryptocurrencyListDataManager: ICryptocurrencyListDataManager {
    
    private let latestCryptocurrenciesService: ILatestCryptocurrenciesService
    
    init(latestCryptocurrenciesService: ILatestCryptocurrenciesService) {
        self.latestCryptocurrenciesService = latestCryptocurrenciesService
    }
    
    func loadDataSource(completion: @escaping ([LatestCryptocurrenciesModel]?) -> Void) {
        latestCryptocurrenciesService.loadLatestCryptocurrencies { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    completion(model)
                }
            case .failure(let error): print(error)
            }
        }
    }
    
}
