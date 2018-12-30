//
//  StatusModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct StatusModel {
    let timestamp: Date
    let errorCode: Int
    let errorMessage: String?
    let elapsed: Int
    let creditCount: Int
}

extension StatusModel: Decodable {}
