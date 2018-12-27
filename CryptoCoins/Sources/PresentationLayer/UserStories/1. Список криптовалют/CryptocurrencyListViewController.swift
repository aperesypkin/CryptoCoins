//
//  CryptocurrencyListViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

class CryptocurrencyListViewController: UIViewController {
    
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
    }

}
