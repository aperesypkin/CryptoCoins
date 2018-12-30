//
//  ServiceAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 28/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let serviceAssembly = DependencyContainer { container in
    container.register { LatestCryptocurrenciesService(requestClient: try! coreAssembly.resolve()) as ILatestCryptocurrenciesService }
}
