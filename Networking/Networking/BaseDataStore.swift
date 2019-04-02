//
//  BaseDataStore.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


class BaseDataStore {
    
    let networking: AlamofireManager
    
    
    init() {
        networking = AlamofireManager()
    }
}
