//
//  CryptocurrenciesIdentifiersRequest.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class CryptocurrenciesIdentifiersRequest: IRequest {
    
    var endpoint: String {
        return "cryptocurrency/map"
    }
    
    var urlParams: [String: String]? {
        return ["limit": "100"]
    }
    
}
