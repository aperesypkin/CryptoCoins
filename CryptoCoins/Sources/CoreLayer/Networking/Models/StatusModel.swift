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

extension StatusModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case timestamp, elapsed
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case creditCount = "credit_count"
    }
}
