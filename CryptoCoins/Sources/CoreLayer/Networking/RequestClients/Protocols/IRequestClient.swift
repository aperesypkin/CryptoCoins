//
//  IRequestClient.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol IRequestClient {
    func send<Parser: IParser>(request: IRequest, parser: Parser, completion: @escaping (Result<Parser.Model>) -> Void)
}
