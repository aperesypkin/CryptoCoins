//
//  CryptocurrencyListViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

final class CryptocurrencyListViewController: UIViewController {
    
    struct ViewModel {
        let image: URL
        let name: String
        let symbol: String
        let price: String?
        let percentChange: String?
    }
    
    private var dataSource: [ViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
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
        
        setupUI()
        loadDataSource()
    }
    
    private func setupUI() {
        title = "cryptocurrency_list_title".localized
    }
    
    private func loadDataSource() {
        dataManager.loadDataSource { [weak self] dataSource in
            self?.dataSource = dataSource
        }
    }

}

extension CryptocurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        
        let cell: CryptocurrencyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel)
        
        return cell
    }
}
