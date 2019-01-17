//
//  LoaderAvailable.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 15/01/2019.
//  Copyright © 2019 Alexander Peresypkin. All rights reserved.
//

import UIKit

protocol LoaderAvailable {
    func startLoaderAnimating()
    func stopLoaderAnimating()
}

extension LoaderAvailable where Self: UIViewController {
    
    func startLoaderAnimating() {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.center = view.center
        activityIndicator.tag = 666
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopLoaderAnimating() {
        if let activityIndicator = view.viewWithTag(666) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
        }
    }
    
}
