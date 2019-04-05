//
//  AlamofireManager.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/22/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


final class AlamofireManager {
    
    var sessionManager: Session
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.default ) {
        
        self.sessionManager = Alamofire.Session(configuration: configuration)
    }
}

extension AlamofireManager: Networking {
    
    func response(_ urlRequest: RequestConvertible) -> DecodableRequest {
        
        let request = AlamofireRequestConverter(withRequest: urlRequest)
        return sessionManager.request(request)
    }
    
    func update(withHeaders headers: Headers) {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        sessionManager.session.invalidateAndCancel()
        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
    func download(_ urlRequest: RequestConvertible) -> DownloadableRequest {
        
        let request = AlamofireRequestConverter(withRequest: urlRequest)
        return sessionManager.download(request)
    }
    
    func upload(file url: URL, with urlRequest: RequestConvertible) -> UploadableRequest {
        
        let request = AlamofireRequestConverter(withRequest: urlRequest)
        return sessionManager.upload(url, with: request)
    }
}

