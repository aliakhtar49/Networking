//
//  ViewController.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/22/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let favoriteDataStore: FavoriteDataStoreProtocol = FavoriteDataStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        favoriteDataStore.getFavorites(params: [:]) { (result) in
            
            switch result {
            case .failure(let error):
                print(error);
            case .success(let user):
                print("user data is \(user)")
            }
            
            
        }
    }


}

