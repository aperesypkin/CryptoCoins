//
//  CommonRequestClient.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

class CommonRequestClient: IRequestClient {
    
    let requestBilder: IRequestBuilder
    
    init(requestBilder: IRequestBuilder) {
        self.requestBilder = requestBilder
    }
    
    func send<Parser: IParser>(request: IRequest,
                               parser: Parser,
                               completionHandler: @escaping (Result<Parser.Model>) -> Void) {
        guard let urlRequest = requestBilder.buildURLRequest(from: request) else {
            completionHandler(.error("url string can't be parsed to URL"))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completionHandler(.error(error.localizedDescription))
                return
            }
            
            guard let data = data, let parsedModel = parser.parse(data: data) else {
                completionHandler(.error("received data can't be parsed"))
                return
            }
            
            completionHandler(.success(parsedModel))
        }
        
        dataTask.resume()
    }
    
}
