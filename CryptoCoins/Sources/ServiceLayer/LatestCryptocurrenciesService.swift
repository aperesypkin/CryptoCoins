//
//  LatestCryptocurrenciesService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ILatestCryptocurrenciesService {
    func fetchLatestCryptocurrencies(completion: @escaping (Result<[LatestCryptocurrenciesModel]>) -> Void)
}

class LatestCryptocurrenciesService: ILatestCryptocurrenciesService {
    
    typealias Model = RootModel<[LatestCryptocurrenciesModel]>
    
    private let requestClient: IRequestClient
    
    init(requestClient: IRequestClient) {
        self.requestClient = requestClient
    }
    
    func fetchLatestCryptocurrencies(completion: @escaping (Result<[LatestCryptocurrenciesModel]>) -> Void) {
        let request = LatestCryptocurrenciesRequest()
        let parser = JSONDecoderParser<Model>()
        requestClient.send(request: request, parser: parser) { result in
            switch result {
            case .success(let model):
                if let dataModel = model.data {
                    completion(.success(dataModel))
                    return
                } else {
                    completion(.error(model.status.errorMessage!))
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
}
