//
//  NetworkManager.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


final class NetworkManager: Networking {
    
    let manager: Networking
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.default ) {
        
        manager = AlamofireManager(configuration: configuration)
    }
    
    func response(_ urlRequest: RequestConvertible) -> DecodableRequest {
        
        return manager.response(urlRequest)
    }
    
    func update(withHeaders headers: Headers) {
        
        return manager.update(withHeaders: headers)
    }
    
    func download(_ urlRequest: RequestConvertible) -> DownloadableRequest {
        
        return manager.download(urlRequest)
    }
    
    func upload(file url: URL, with urlRequest: RequestConvertible) -> UploadableRequest {
        
        return manager.upload(file: url, with: urlRequest)
    }
    
}
