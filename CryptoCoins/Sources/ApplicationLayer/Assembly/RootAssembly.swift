//
//  RootAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 23/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let rootAssembly = DependencyContainer { container in
    unowned let container = container
    
    container.register { UIWindow(frame: UIScreen.main.bounds) }.resolvingProperties { _, window in
        let viewController = try! cryptocurrencyListAssembly.resolve() as CryptocurrencyListViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.backgroundColor = .white
    }
}
