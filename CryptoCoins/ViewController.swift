//
//  ViewController.swift
//  CryptoCoins
//
//  Created by Alexander Peresypkin on 12/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let requestClient: IRequestClient
    
    init(requestClient: IRequestClient) {
        self.requestClient = requestClient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "test_key".localized
        
        requestClient.send(request: TestRequest(), parser: TestParser()) { result in
            switch result {
            case .success(let model): print(model)
            case .error(let error): print(error)
            }
        }
    }

}

class TestRequest: IRequest {
    var endpoint: String {
        return "cryptocurrency/info?id=1,2,10"
    }
}

class TestParser: IParser {
    func parse(data: Data) -> TestModel? {
        print(String(data: data, encoding: .utf8))
        return nil
    }
}

struct TestModel {
    let data: String
}
