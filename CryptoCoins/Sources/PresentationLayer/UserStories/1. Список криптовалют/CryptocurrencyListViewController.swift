//
//  CryptocurrencyListViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit
import SnapKit

final class CryptocurrencyListViewController: UIViewController {
    
    private var cryptocurrencies: [CryptocurrencyListViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: ICryptocurrencyListPresenter!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 65
        tableView.register(CryptocurrencyTableViewCell.self)
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        title = "cryptocurrency_list_title".localized
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension CryptocurrencyListViewController: ICryptocurrencyListView {
    func update(viewModels: [CryptocurrencyListViewModel]) {
        cryptocurrencies = viewModels
    }
}

extension CryptocurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cryptocurrency = cryptocurrencies[indexPath.row]
        
        let cell: CryptocurrencyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: cryptocurrency)
        return cell
    }
}

class TableViewCommonCell<View: UIView>: UITableViewCell {
    
}
