//
//  CryptocurrencyListAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 26/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let cryptocurrencyListAssembly = DependencyContainer { container in
    container.register { CryptocurrencyListViewController(dataManager: $0) }
    container.register {
        CryptocurrencyListDataManager(latestCryptocurrenciesService: try! serviceAssembly.resolve(),
                                      cryptocurrenciesInfoService: try! serviceAssembly.resolve())
            as ICryptocurrencyListDataManager
    }
    
}
