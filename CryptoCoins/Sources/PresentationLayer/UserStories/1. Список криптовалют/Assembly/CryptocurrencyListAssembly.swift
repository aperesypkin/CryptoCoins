//
//  CryptocurrencyListAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 26/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let cryptocurrencyListAssembly = DependencyContainer { container in
    container.register { CryptocurrencyListViewController() }
        .implements(UIViewController.self,
                    ICryptocurrencyListView.self)
        .resolvingProperties { container, controller in
            controller.presenter = try! container.resolve()
    }
    
    container.register { CryptocurrencyListPresenter() }
        .implements(ICryptocurrencyListPresenter.self)
        .resolvingProperties { container, presenter in
            presenter.view = try! container.resolve()
    }
}
