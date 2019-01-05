//
//  Double+Round.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        return Darwin.round(self * multiplier) / multiplier
    }
}
