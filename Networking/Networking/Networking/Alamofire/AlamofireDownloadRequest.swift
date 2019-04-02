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
    
    func cancel() {
        let _ : Alamofire.DownloadRequest = cancel()
    }
    
    func response(completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
        
        response { (response) in
            
            let downloadResponse = response as DownloadResponse
            completion(downloadResponse)
            
            }.downloadProgress { (downloadProgress) in
                progress(downloadProgress.fractionCompleted)
        }
    }
    
    func resume(data: Data, completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
       // download(resumingWith: data).response(completion: completion, progress: progress) //Check
    }
    
}

extension Alamofire.DownloadResponse: DownloadResponse {
    var destinationURL: URL? {
        return fileURL
    }
}
