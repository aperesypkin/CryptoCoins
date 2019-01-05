//
//  CryptocurrencyTableViewCell.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 31/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit
import Kingfisher

class CryptocurrencyTableViewCell: UITableViewCell, ConfigurableView {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var percentChangeLabel: UILabel!
    
    func configure(with model: CryptocurrencyListViewController.ViewModel) {
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        priceLabel.text = model.price
        percentChangeLabel.text = model.percentChange
        coinImageView.kf.setImage(with: model.image)
    }
    
}
