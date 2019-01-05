//
//  LatestCryptocurrenciesRequest.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class LatestCryptocurrenciesRequest: IRequest {
    var endpoint: String {
        return "cryptocurrency/listings/latest"
    }
    
    var urlParams: [String: String]? {
        return ["cryptocurrency_type": "coins"]
    }
}
