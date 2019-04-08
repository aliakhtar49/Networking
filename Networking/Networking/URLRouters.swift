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
        var route: String = "https://jsonplaceholder.typicode.com/todos/1"
    }
    
    
    struct Terms: Readable, Patchable {
        var route: String = "agreements/current"
    }
    struct ToDo: Readable {
        var route: String = "https://jsonplaceholder.typicode.com/todos/ddddd1"
        
        
    }
    struct Post: Readable {
        var route: String = "https://jsonplaceholder.typicode.com/posts"
        
    }
    struct EmptyRouter: Readable {
        var route: String = ""
    }
    struct UrlNotFoundRouter: Readable {
        var route: String = "https://no_url_exists.com"
    }
}


