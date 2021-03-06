//
//  LatestCryptocurrenciesService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class LatestCryptocurrenciesService: ILatestCryptocurrenciesService {
    
    typealias Model = RootModel<[LatestCryptocurrencyModel]>
    
    private let requestClient: IRequestClient
    
    init(requestClient: IRequestClient) {
        self.requestClient = requestClient
    }
    
    func loadLatestCryptocurrencies(completion: @escaping (Result<[LatestCryptocurrencyModel]>) -> Void) {
        let request = LatestCryptocurrenciesRequest()
        let parser = JSONDecoderParser<Model>()
        requestClient.send(request: request, parser: parser) { result in
            switch result {
            case .success(let model):
                if let dataModel = model.data {
                    completion(.success(dataModel))
                } else if let errorMessage = model.status.errorMessage {
                    completion(.failure(errorMessage))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
