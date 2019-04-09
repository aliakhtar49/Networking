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
    var requestGenerator: AlamofireRequestGenerator
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.default, requestGenerator: AlamofireRequestGenerator = AlamofireRequestGenerator() ) {
        
        self.sessionManager = Alamofire.Session(configuration: configuration)
        self.requestGenerator = requestGenerator
    }
}

extension AlamofireManager: Networking {
    
    func response(_ urlRequest: RequestConvertible) -> DecodableRequest {
        
        let request = requestGenerator.getURLRequestConvertible(from: urlRequest)
        return sessionManager.request(request)
    }
    
    func update(withHeaders headers: Headers) {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        sessionManager.session.invalidateAndCancel()
        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
    func download(_ urlRequest: RequestConvertible) -> DownloadableRequest {
        
        let request = requestGenerator.getURLRequestConvertible(from: urlRequest)
        return sessionManager.download(request)
    }
    
    func upload(file url: URL, with urlRequest: RequestConvertible) -> UploadableRequest {
        
        let request = requestGenerator.getURLRequestConvertible(from: urlRequest)
        return sessionManager.upload(url, with: request)
    }
    func upload(mulitpart: MultipartFormData, with urlRequest: RequestConvertible) -> UploadableRequest {
       
      
        
        let request = requestGenerator.getURLRequestConvertible(from: urlRequest)
        return sessionManager.upload(multipartFormData: { (mutlipartForm) in
        mutlipartForm.append(urlRequest.parameters.description.data(using: .utf8)!, withName: "description")
        mutlipartForm.append(imgData!, withName: "image")
        }, with: request)
    }
}



