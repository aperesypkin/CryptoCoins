//
//  JSONDecoderParser.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

final class JSONDecoderParser<DecodableModel: Decodable>: IParser {
    
    func parse(data: Data) -> DecodableModel? {
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        do {
            let model = try decoder.decode(DecodableModel.self, from: data)
            return model
        } catch {
            print(error)
            return nil
        }
    }
    
}
