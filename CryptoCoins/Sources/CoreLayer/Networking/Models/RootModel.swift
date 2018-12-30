//
//  RootModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct RootModel<DataModel: Decodable> {
    let data: DataModel?
    let status: StatusModel
}

extension RootModel: Decodable {}
