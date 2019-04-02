//
//  DataResponseable.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/27/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


protocol DataResponseable {
    
    typealias DataResponseHandler<T> = (DataResponseModel<T>) -> Void
    typealias ResultHandler<T> = (ResultType<T>) -> Void
}
