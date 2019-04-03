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
   
    func cancel() {
        let _ : Alamofire.DataRequest = cancel()
    }
    
      private func convertResponseToDataResponseModel<T>(dataResponse : DataResponse<T>) ->
            DataResponseModel<T> {
            
                switch (dataResponse.value,dataResponse.error) {
                    
                case let (.some(value), nil):
                   return  DataResponseModel<T>(result: .success(value))
                    
               case let (nil, .some(error)):
                  return  DataResponseModel<T>(result: .failure(NetworkErrors.underlying(error)))
    
                default:
                    let error = NSError(domain:NSURLErrorDomain, code:NSURLErrorUnknown, userInfo:nil)
                     return  DataResponseModel<T>(result: .failure(NetworkErrors.underlying(error)))
                }
    }
    func responseDecodable<T>(completionHandler: @escaping (DataResponseHandler<T>)) where T : Decodable {
        
        responseDecodable { (dataResponse : DataResponse<T>) in
            completionHandler(self.convertResponseToDataResponseModel(dataResponse: dataResponse))
        }
    }
}
