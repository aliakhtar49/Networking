//
//  DataResponseModel.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/27/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//



typealias Headers = [String:String]?

struct DataResponseModel<T> {
    
    let result: ResultType<T>
}

enum ResultType<T> {
    case success(T)
    case failure(NetworkErrors)
}
