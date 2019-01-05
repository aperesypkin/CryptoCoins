//
//  Environment.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

enum Environment {
    case debug, production
    
    static var current: Environment {
        let appDelegate = UIApplication.shared.delegate
        let targetName = String(describing: appDelegate!).components(separatedBy: ".").first!.replacingOccurrences(of: "<", with: "")
        
        switch targetName {
        case "Debug": return .debug
        case "Production": return .production
        default: fatalError()
        }
    }
}
