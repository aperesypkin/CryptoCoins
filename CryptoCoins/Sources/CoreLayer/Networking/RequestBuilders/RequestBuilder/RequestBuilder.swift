//
//  RequestBuilder.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

class RequestBuilder: IRequestBuilder {
    func buildURLRequest(from request: IRequest) -> URLRequest? {
        var urlComponents = URLComponents(string: "\(request.domain)/\(request.apiVersion)/\(request.endpoint)")
        
        if let urlParams = request.urlParams, !urlParams.isEmpty {
            urlComponents?.queryItems = urlParams.queryItems
        }
        
        guard let url = urlComponents?.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("deflate, gzip", forHTTPHeaderField: "Accept-Encoding")
        urlRequest.addValue(request.apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        return urlRequest
    }
}

extension Dictionary where Key == String, Value == String {
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        for (key, value) in self {
            items.append(URLQueryItem(name: key, value: value))
        }
        return items
    }
}
