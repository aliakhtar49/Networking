//
//  DecodableRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


protocol DecodableRequest: DataResponseable, CancelableRequest {
    
    func responseDecodable<T: Codable>(completionHandler: @escaping DataResponseHandler<T>)
}


