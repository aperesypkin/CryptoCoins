//
//  LatestMarketQuotesService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class LatestMarketQuotesService: ILatestMarketQuotesService {
    
    typealias Model = RootModel<[String: LatestMarketQuotesModel]>
    
    private let requestClient: IRequestClient
    
    init(requestClient: IRequestClient) {
        self.requestClient = requestClient
    }
    
    func loadLatestMarketQuotes(for identifiers: [Int], completion: @escaping (Result<[String: LatestMarketQuotesModel]>) -> Void) {
        let request = LatestMarketQuotesRequest(identifiers: identifiers)
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
