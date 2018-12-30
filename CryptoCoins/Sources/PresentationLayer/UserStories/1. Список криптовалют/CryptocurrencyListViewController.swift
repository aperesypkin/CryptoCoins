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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self)
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
        
        title = "test_key".localized
        loadDataSource()
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
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(model.name) \(model.numMarketPairs)"
        
        return cell
    }
}
