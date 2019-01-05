//
//  CoreAssembly.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 26/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Dip

let coreAssembly = DependencyContainer { container in
    unowned let container = container
    
    container.register { RequestClient(requestBilder: $0) as IRequestClient }
    container.register { RequestBuilder() as IRequestBuilder }
}
