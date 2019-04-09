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
    
    func response(completion: @escaping UploadResponseClosure) {
        
        let _: Alamofire.UploadRequest = response { (dataResponse) in
            let uploadResponse = dataResponse as UploadResponse
            if let data = dataResponse.data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }

            completion(uploadResponse)
            
        }
    }
    
    func progress(_ progress: @escaping UploadProgressClosure) {
        
        uploadProgress { (uploadProgress) in
            progress(uploadProgress.fractionCompleted)
        }
    }
    
}


extension Alamofire.DataResponse: UploadResponse {

}
