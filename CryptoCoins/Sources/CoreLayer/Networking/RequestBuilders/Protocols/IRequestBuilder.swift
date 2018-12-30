//
//  IRequestBuilder.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 22/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

protocol IRequestBuilder {
    func buildURLRequest(from request: IRequest) -> URLRequest?
}
