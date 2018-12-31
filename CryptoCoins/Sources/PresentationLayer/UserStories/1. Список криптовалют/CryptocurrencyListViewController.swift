//
//  CryptocurrencyListViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

final class CryptocurrencyListViewController: UIViewController {
    
    private var dataSource: [LatestCryptocurrenciesModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(CryptocurrencyTableViewCell.self)
            tableView.dataSource = self
        }
    }
    
    private let dataManager: ICryptocurrencyListDataManager
    
    init(dataManager: ICryptocurrencyListDataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadDataSource()
    }
    
    private func setup() {
        title = "test_key".localized
    }
    
    private func loadDataSource() {
        dataManager.loadDataSource { dataSource in
            if let dataSource = dataSource {
                self.dataSource = dataSource
            }
        }
    }

}

extension CryptocurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        
        let cell: CryptocurrencyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.nameLabel.text = model.name
        cell.symbolLabel.text = model.symbol
        
        guard let usdQuote = model.quote["USD"] else { return cell }
        cell.priceLabel.text = "\(usdQuote.price.rounded(toPlaces: 2)) $"
        cell.percentChangeLabel.text = "\(usdQuote.percentChange1h.rounded(toPlaces: 1)) %"
        
        return cell
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        return Darwin.round(self * multiplier) / multiplier
    }
}
