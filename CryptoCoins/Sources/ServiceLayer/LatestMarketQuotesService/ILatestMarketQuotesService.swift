//
//  ILatestMarketQuotesService.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 05/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol ILatestMarketQuotesService {
    func loadLatestMarketQuotes(for identifiers: [Int], completion: @escaping (Result<[String: LatestMarketQuotesModel]>) -> Void)
}
