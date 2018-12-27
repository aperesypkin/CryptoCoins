//
//  ParsableModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 27/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ParsableModel {
    static func parse(data: Data) -> Self?
}

extension ParsableModel where Self: Decodable {
    static func parse(data: Data) -> Self? {
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}
