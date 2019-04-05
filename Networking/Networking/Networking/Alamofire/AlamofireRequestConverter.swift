//
//  AlamofireRequestConverter.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/22/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


struct AlamofireRequestConverter: URLRequestConvertible {
    
    var request: RequestConvertible
    
    public init(withRequest request: RequestConvertible)
    {
        self.request = request
    }
    
    /// Required method to conform to the `URLRequestConvertible` protocol.
    ///
    /// - Returns: URLRequest object
    /// - Throws: An `Error` if the underlying `URLRequest` is `nil`.
    func asURLRequest() throws -> URLRequest {
        let url = try request.route.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.timeoutInterval = request.timeout
        let encoding: Alamofire.ParameterEncoding? = request.method == .get ? URLEncoding.default : JSONEncoding.default
        if let _encoding = encoding {
            return try _encoding.encode(urlRequest, with: request.parameters)
        }
        
        return urlRequest
    }
}

struct AlamofireRequestGenerator {
    
    init() {
        
    }
    
    public func getURLRequestConvertible(from requestConvertible: RequestConvertible) -> URLRequestConvertible {
        
        let urlRequestConvertible = AlamofireRequestConverter(withRequest: requestConvertible)
        return urlRequestConvertible
    }
}
