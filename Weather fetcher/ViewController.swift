//
//  ViewController.swift
//  Weather fetcher
//
//  Created by Wren Liang on 2019-08-06.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let city = "Calgary"
        let dataManager = DataManager();
        let retrievalURL = try! dataManager.createRetrievalURL(baseURL: API.BaseURL, APIKey: API.Key, city: city);
        
        dataManager.retrieveData(retrievalURL: retrievalURL);
        print(dataManager.json);
    }


}

