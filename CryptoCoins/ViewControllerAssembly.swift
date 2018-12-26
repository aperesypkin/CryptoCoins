//
//  ViewControllerAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 26/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let viewControllerAssembly = DependencyContainer { container in
    container.register(.shared) { ViewController() }.resolvingProperties { _, controller in
        controller.view.backgroundColor = .white
    }
}
