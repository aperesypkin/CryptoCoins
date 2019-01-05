//
//  CryptocurrencyTableViewCell.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 31/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit
import Kingfisher

class CryptocurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var coinImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var percentChangeLabel: UILabel!
    
    func configure(with viewModel: CryptocurrencyListViewController.ViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        percentChangeLabel.text = viewModel.percentChange
        coinImageView.kf.setImage(with: viewModel.image)
    }
    
}
