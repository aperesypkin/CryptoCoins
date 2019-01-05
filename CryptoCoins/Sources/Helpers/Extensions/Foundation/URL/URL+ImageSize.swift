//
//  URL+ImageSize.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 04/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import Foundation

extension URL {
    
    enum ImageSize: String {
        case size16 = "16x16"
        case size32 = "32x32"
        case size64 = "64x64"
        case size128 = "128x128"
        case size200 = "200x200"
    }
    
    func size(of size: ImageSize) -> URL? {
        let urlString = self.absoluteString.replacingOccurrences(of: "64x64", with: size.rawValue)
        return URL(string: urlString)
    }
    
}
