//
//  ServiceAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 28/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let serviceAssembly = DependencyContainer { container in
    unowned let container = container
    
    container.register { LatestCryptocurrenciesService(requestClient: try! coreAssembly.resolve()) as ILatestCryptocurrenciesService }
    container.register { CryptocurrenciesInfoService(requestClient: try! coreAssembly.resolve()) as ICryptocurrenciesInfoService }
    container.register { CryptocurrenciesIdentifiersService(requestClient: try! coreAssembly.resolve()) as ICryptocurrenciesIdentifiersService }
    container.register { LatestMarketQuotesService(requestClient: try! coreAssembly.resolve()) as ILatestMarketQuotesService }
}
