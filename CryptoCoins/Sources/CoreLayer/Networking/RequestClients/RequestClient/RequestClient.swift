//
//  RequestClient.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

class RequestClient: IRequestClient {
    
    private let requestBilder: IRequestBuilder
    
    init(requestBilder: IRequestBuilder) {
        self.requestBilder = requestBilder
    }
    
    func send<Parser: IParser>(request: IRequest, parser: Parser, completion: @escaping (Result<Parser.Model>) -> Void) {
        guard let urlRequest = requestBilder.buildURLRequest(from: request) else {
            completion(.error("⚠️ Не получилось сбилдить URLRequest"))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.error(error.localizedDescription))
                return
            }
            
            guard let data = data, let parsedModel = parser.parse(data: data) else {
                completion(.error("⚠️ Не получилось распарсить модель"))
                return
            }
            
            completion(.success(parsedModel))
        }
        
        dataTask.resume()
    }
    
}
