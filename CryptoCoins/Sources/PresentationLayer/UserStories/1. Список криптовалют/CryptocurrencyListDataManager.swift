//
//  CryptocurrencyListDataManager.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrencyListDataManager {
    func loadDataSource(completion: @escaping ([CryptocurrencyListViewController.ViewModel]?) -> Void)
}

final class CryptocurrencyListDataManager: ICryptocurrencyListDataManager {
    
    typealias ViewModel = CryptocurrencyListViewController.ViewModel
    
    private let viewModelFactory = CryptocurrencyListViewModelFactory()
    
    
    
    private let latestCryptocurrenciesService: ILatestCryptocurrenciesService
    private let cryptocurrenciesInfoService: ICryptocurrenciesInfoService
    private let latestMarketQuotesService: ILatestMarketQuotesService
    
    init(latestCryptocurrenciesService: ILatestCryptocurrenciesService,
         cryptocurrenciesInfoService: ICryptocurrenciesInfoService,
         latestMarketQuotesService: ILatestMarketQuotesService) {
        self.latestCryptocurrenciesService = latestCryptocurrenciesService
        self.cryptocurrenciesInfoService = cryptocurrenciesInfoService
        self.latestMarketQuotesService = latestMarketQuotesService
    }
    
    func loadDataSource(completion: @escaping ([ViewModel]?) -> Void) {
        
        var identifiers: [Int] = []
        var cryptocurrencyMetadataModels: [String: CryptocurrencyMetadataModel] = [:]
        var latestMarketQuotesModels: [String: LatestMarketQuotesModel] = [:]
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        latestCryptocurrenciesService.loadLatestCryptocurrencies { result in
            switch result {
            case .success(let model):
                identifiers = model.map { $0.id }
            case .failure(let error):
                print(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.wait()
        
        dispatchGroup.enter()
        cryptocurrenciesInfoService.loadCryptocurrenciesInfo(for: identifiers) { result in
            switch result {
            case .success(let model):
                cryptocurrencyMetadataModels = model
            case .failure(let error):
                print(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        latestMarketQuotesService.loadLatestMarketQuotes(for: identifiers) { result in
            switch result {
            case .success(let model):
                latestMarketQuotesModels = model
            case .failure(let error):
                print(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .global()) {
            var viewModels: [ViewModel] = []
            
            identifiers.forEach {
                if let metadata = cryptocurrencyMetadataModels[String($0)],
                    let quotes = latestMarketQuotesModels[String($0)] {
                    viewModels.append(self.viewModelFactory.createViewModel(quotes: quotes,
                                                                            metadata: metadata))
                }
            }
            
            DispatchQueue.main.async {
                completion(viewModels)
            }
        }
        
    }
    
}
