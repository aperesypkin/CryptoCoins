//
//  CryptocurrencyListViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

final class CryptocurrencyListViewController: UIViewController {
    
    private var cryptocurrencies: [CryptocurrencyListViewModel] = []
    
    private let presenter: ICryptocurrencyListPresenter
    
    init(presenter: ICryptocurrencyListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        title = "cryptocurrency_list_title".localized
    }

}

extension CryptocurrencyListViewController: ICryptocurrencyListView {
    func update(viewModels: [CryptocurrencyListViewModel]) {
        cryptocurrencies = viewModels
    }
}
