//
//  ViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "test_key".localized
        
        let view = UIView(frame: .init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        self.view.addSubview(view)
    }

}
