//
//  CryptocurrencyListDataManager.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrencyListDataManager {
    func loadDataSource(completion: @escaping ([CryptocurrencyListViewController.ViewModel]) -> Void)
}

final class CryptocurrencyListDataManager: ICryptocurrencyListDataManager {
    
    typealias ViewModel = CryptocurrencyListViewController.ViewModel
    
    private let viewModelFactory = CryptocurrencyListViewModelFactory()
    
    private var latestCryptocurrencyModels: [LatestCryptocurrencyModel] = []
    private var cryptocurrencyMetadataModels: [String: CryptocurrencyMetadataModel] = [:]
    
    private let dispatchGroup = DispatchGroup()
    
    private let latestCryptocurrenciesService: ILatestCryptocurrenciesService
    private let cryptocurrenciesInfoService: ICryptocurrenciesInfoService
    
    init(latestCryptocurrenciesService: ILatestCryptocurrenciesService,
         cryptocurrenciesInfoService: ICryptocurrenciesInfoService) {
        self.latestCryptocurrenciesService = latestCryptocurrenciesService
        self.cryptocurrenciesInfoService = cryptocurrenciesInfoService
    }
    
    func loadDataSource(completion: @escaping ([ViewModel]) -> Void) {
        loadLatestCryptocurrencies()
        loadCryptocurrenciesInfo()
        createViewModels(completion: completion)
    }
    
    private func loadLatestCryptocurrencies() {
        dispatchGroup.enter()
        latestCryptocurrenciesService.loadLatestCryptocurrencies { result in
            switch result {
            case .success(let model):
                self.latestCryptocurrencyModels = model
            case .failure(let error):
                print(error)
            }
            self.dispatchGroup.leave()
        }
        dispatchGroup.wait()
    }
    
    private func loadCryptocurrenciesInfo() {
        dispatchGroup.enter()
        cryptocurrenciesInfoService.loadCryptocurrenciesInfo(for: latestCryptocurrencyModels.map { $0.id }) { result in
            switch result {
            case .success(let model):
                self.cryptocurrencyMetadataModels = model
            case .failure(let error):
                print(error)
            }
            self.dispatchGroup.leave()
        }
    }
    
    private func createViewModels(completion: @escaping ([ViewModel]) -> Void) {
        dispatchGroup.notify(queue: .global()) {
            var viewModels: [ViewModel] = []
            
            self.latestCryptocurrencyModels.forEach {
                let identifier = String($0.id)
                guard let metadata = self.cryptocurrencyMetadataModels[identifier] else { return }
                
                let viewModel = self.viewModelFactory.createViewModel(quotes: $0.quote, metadata: metadata)
                viewModels.append(viewModel)
            }
            
            DispatchQueue.main.async {
                completion(viewModels)
            }
        }
    }
    
}
