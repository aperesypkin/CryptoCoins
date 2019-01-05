//
//  CryptocurrencyLinksModel.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 01/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

struct CryptocurrencyLinksModel {
    let website: [URL]
    let explorer: [URL]
    let sourceCode: [URL]
    let messageBoard: [URL]
    let chat: [URL]
    let announcement: [URL]
    let reddit: [URL]
    let twitter: [URL]
}

extension CryptocurrencyLinksModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case website, explorer, chat, announcement, reddit, twitter
        case sourceCode = "source_code"
        case messageBoard = "message_board"
    }
}
