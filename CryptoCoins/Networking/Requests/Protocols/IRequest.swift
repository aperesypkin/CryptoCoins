//
//  IRequest.swift
//  Debug
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

enum ApiVersion: String {
    case v1, v2
}

protocol IRequest {
    var domain: String { get }
    var apiKey: String { get }
    var apiVersion: ApiVersion { get }
    var endpoint: String { get }
    var body: [String: String]? { get }
}

extension IRequest {
    var domain: String {
        switch Environment.current {
        case .debug: return "https://sandbox-api.coinmarketcap.com"
        case .production: return "https://pro-api.coinmarketcap.com"
        }
    }
    
    var apiKey: String {
        switch Environment.current {
        case .debug: return "2143b118-debf-4a41-9cfa-ad97328edab8"
        case .production: return ""
        }
    }
    
    var apiVersion: ApiVersion {
        return .v1
    }
    
    var body: [String: String]? {
        return nil
    }
}
