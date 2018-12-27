//
//  String+Localized.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 26/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
