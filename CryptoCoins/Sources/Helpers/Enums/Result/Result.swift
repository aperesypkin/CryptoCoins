//
//  Result.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(String)
}

extension Result {
    var resolve: Value? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    
    var error: String? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
}
