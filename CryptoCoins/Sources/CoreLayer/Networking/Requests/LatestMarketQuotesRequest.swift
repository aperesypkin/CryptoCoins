//
//  LatestMarketQuotesRequest.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class LatestMarketQuotesRequest: IRequest {
    
    private let identifiers: String
    
    init(identifiers: [Int]) {
        self.identifiers = identifiers.map { String($0) }.joined(separator: ",")
    }
    
    var endpoint: String {
        return "cryptocurrency/quotes/latest"
    }
    
    var urlParams: [String: String]? {
        return ["id": identifiers]
    }
    
}
