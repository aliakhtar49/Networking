//
//  AlamofireUploadRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire



extension Alamofire.UploadRequest: UploadableRequest {
    
    func response(completion: @escaping UploadResponseClosure, progress: @escaping UploadProgressClosure) {
        
        response { (dataResponse) in
            
            let uploadResponse = dataResponse as! UploadResponse //Check
            completion(uploadResponse)
            
            }.uploadProgress { (uploadProgress) in
                progress(uploadProgress.fractionCompleted)
        }
    }
}
