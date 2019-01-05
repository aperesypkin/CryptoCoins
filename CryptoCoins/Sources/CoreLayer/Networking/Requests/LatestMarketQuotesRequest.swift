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
        var values = ""
        identifiers.forEach { values += "\($0)," }
        self.identifiers = String(values.dropLast())
    }
    
    var endpoint: String {
        return "cryptocurrency/quotes/latest"
    }
    
    var urlParams: [String: String]? {
        return ["id": identifiers]
    }
    
}
