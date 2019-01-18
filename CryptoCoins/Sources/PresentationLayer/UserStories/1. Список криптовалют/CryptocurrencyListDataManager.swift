//
//  CryptocurrencyListPresenter.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ICryptocurrencyListView: AnyObject {
    func update(viewModels: [CryptocurrencyListViewModel])
}

protocol ICryptocurrencyListPresenter {
    func viewDidLoad()
}

struct CryptocurrencyListViewModel {
    let image: URL
    let name: String
    let symbol: String
    let price: String?
    let percentChange: String?
}

final class CryptocurrencyListPresenter {
    
    weak var view: ICryptocurrencyListView?
    
    private let viewModelFactory = CryptocurrencyListViewModelFactory()
    
    private let latestCryptocurrenciesService: ILatestCryptocurrenciesService
    private let cryptocurrenciesInfoService: ICryptocurrenciesInfoService
    
    init(latestCryptocurrenciesService: ILatestCryptocurrenciesService,
         cryptocurrenciesInfoService: ICryptocurrenciesInfoService) {
        self.latestCryptocurrenciesService = latestCryptocurrenciesService
        self.cryptocurrenciesInfoService = cryptocurrenciesInfoService
    }
    
}

extension CryptocurrencyListPresenter: ICryptocurrencyListPresenter {
    
    func viewDidLoad() {
        var latestCryptocurrencyModels: [LatestCryptocurrencyModel] = []
        var cryptocurrencyMetadataModels: [String: CryptocurrencyMetadataModel] = [:]
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        latestCryptocurrenciesService.loadLatestCryptocurrencies { result in
            switch result {
            case .success(let model):
                latestCryptocurrencyModels = model
            case .failure(let error):
                print(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.wait()
        
        dispatchGroup.enter()
        cryptocurrenciesInfoService.loadCryptocurrenciesInfo(for: latestCryptocurrencyModels.map { $0.id }) { result in
            switch result {
            case .success(let model):
                cryptocurrencyMetadataModels = model
            case .failure(let error):
                print(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .global()) {
            var viewModels: [CryptocurrencyListViewModel] = []
            
            latestCryptocurrencyModels.forEach {
                let identifier = String($0.id)
                guard let metadata = cryptocurrencyMetadataModels[identifier] else { return }
                
                let viewModel = self.viewModelFactory.createViewModel(quotes: $0.quote, metadata: metadata)
                viewModels.append(viewModel)
            }
            
            DispatchQueue.main.async {
                self.view?.update(viewModels: viewModels)
            }
        }
    }
}
