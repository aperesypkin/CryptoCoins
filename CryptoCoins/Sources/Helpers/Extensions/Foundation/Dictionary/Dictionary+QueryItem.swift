//
//  Dictionary+QueryItem.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        for (key, value) in self {
            items.append(URLQueryItem(name: key, value: value))
        }
        return items
    }
}
