//
//  URLRouters.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation



struct URLRouters {
    
    struct User: Updatable, Creatable {
        var route: String =  "users/registration"
    }
    
    
    struct Favorites: Readable, Creatable {
        var route: String = "favourites/places"
    }
    
    
    struct Terms: Readable, Patchable {
        var route: String = "agreements/current"
    }
}


