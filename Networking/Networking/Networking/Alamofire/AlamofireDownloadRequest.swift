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
        //Check
    }
    
    
    func response(completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
        
        response { (response) in
            
            let downloadResponse = response as! DownloadResponse //Check
            completion(downloadResponse)
            
            }.downloadProgress { (downloadProgress) in
                progress(downloadProgress.fractionCompleted)
        }
    }
    
    func resume(data: Data, completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure) {
        
       // download(resumingWith: data).response(completion: completion, progress: progress) //Check
    }
    
}


//Check
//extension Alamofire.DefaultDownloadResponse: DownloadResponse {
//
//}
