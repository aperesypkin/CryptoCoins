//
//  CryptocurrenciesIdentifiersService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class CryptocurrenciesIdentifiersService: ICryptocurrenciesIdentifiersService {
    
    typealias Model = RootModel<[CryptocurrencyIdentifiersModel]>
    
    private let requestClient: IRequestClient
    
    init(requestClient: IRequestClient) {
        self.requestClient = requestClient
    }
    
    func loadCryptocurrenciesIdentifiers(completion: @escaping (Result<[CryptocurrencyIdentifiersModel]>) -> Void) {
        let request = CryptocurrenciesIdentifiersRequest()
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
