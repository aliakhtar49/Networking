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
        
    }
    
    func responseDecodable<T>(completionHandler: @escaping (DataResponseHandler<T>)) where T : Decodable {
        
        response { (dataResponse) in
            
            guard let data = dataResponse.data else {
                let response = DataResponseModel<T>(result: .failure(dataResponse.error as! NetworkErrors))//DataResponse<T>(value: nil, error: dataResponse.error)
                completionHandler(response)
                return
            }
            
            do {
                
                let value: T = try JSONDecoder().decode(T.self, from: data)
                let response = DataResponseModel<T>(result: .success(value))
                completionHandler(response)
                
            } catch {
                
                let response = DataResponseModel<T>(result: .failure(error as! NetworkErrors))
                completionHandler(response)
            }
        }
    }
}
