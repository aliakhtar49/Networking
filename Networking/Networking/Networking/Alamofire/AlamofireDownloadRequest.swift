//
//  AlamofireDownloadRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


// MARK: DownloadRequest

extension Alamofire.DownloadRequest: DownloadableRequest {
    
    
    
    /// Handler to be called once the request has finished.
    ///
    /// - Parameters:
    ///   - completion: The code to be executed once the request has finished.
    
    func response(completion: @escaping DownloadResponseClosure) {
        let _ :Alamofire.DownloadRequest = response { (response) in
            let downloadResponse = response as DownloadResponse
            completion(downloadResponse)
        }
    }

    
    
    /// Periodically calls the closure as data is read from the server.
    ///
    /// - Parameters:
    ///   - progress: The code to be executed periodically once the request has finished.
    
    func progress(_ progress: @escaping DownloadProgressClosure) {
        downloadProgress { (downloadProgress) in
            progress(downloadProgress.fractionCompleted)
        }
    }
    
    
    
    func resume(data: Data, completion: @escaping DownloadResponseClosure) {
            
    }
    
    
    /// Validates that the response has a status code in the specified sequence.
    ///
    /// - Parameters:
    ///   - validationType: The `ValidationType`.
    
    func validate(validationType: ValidationType) {
        validate(statusCode: validationType.statusCodes)
    }
    
    
    
    /// Cancels the Request.

    func cancel() {
        let _: Alamofire.DownloadRequest = cancel()
    }
    
}




// MARK: DownloadResponse

extension Alamofire.DownloadResponse: DownloadResponse {
    
    
    /// The destination URL of the data returned from the server.

    var destinationURL: URL? {
        return fileURL
    }
}
