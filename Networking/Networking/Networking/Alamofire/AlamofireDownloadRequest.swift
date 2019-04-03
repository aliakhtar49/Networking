//
//  AlamofireDownloadRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


extension Alamofire.DownloadRequest: DownloadableRequest {
    
    
    func response(completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
        
        response { (response) in
            
            let downloadResponse = response as DownloadResponse
            completion(downloadResponse)
            
            }.downloadProgress { (downloadProgress) in
                progress(downloadProgress.fractionCompleted)
        }
    }
    
    
    func resume(data: Data, completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
            
    }
    
    
    func validate(validationType: ValidationType) {
        validate(statusCode: validationType.statusCodes)
    }
    
    
    func cancel() {
        let _: Alamofire.DownloadRequest = cancel()
    }
    
}

extension Alamofire.DownloadResponse: DownloadResponse {
    var destinationURL: URL? {
        return fileURL
    }
}
