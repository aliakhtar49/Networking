//
//  AlamofireDecodableRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


extension Alamofire.DataRequest: DecodableRequest {

    func responseDecodable<T>(completionHandler: @escaping (DataResponseHandler<T>)) where T : Decodable {
        
        responseDecodable { (dataResponse : DataResponse<T>) in
            
            guard let value = dataResponse.result.value else {
                let response = DataResponseModel<T>(result: .failure(dataResponse.error as! NetworkErrors))
                completionHandler(response)
                return
            }
            let response = DataResponseModel<T>(result: .success(value))
            completionHandler(response)
        }
    }
    
    func validate(validationType: ValidationType) {
        validate(statusCode: validationType.statusCodes)
    }
    
}
