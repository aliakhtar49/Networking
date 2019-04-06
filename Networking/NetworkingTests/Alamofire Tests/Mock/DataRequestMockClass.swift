//
//  DataRequestMockClass.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire



class DataRequestMockClass<T: Decodable> : DataRequestTestableProtocol {
    
    var responseModelResult: (DataResponse<T>)
    
    init(_ dataResponse: DataResponse<T> ) {
        self.responseModelResult = dataResponse
    }
    
    @discardableResult
    func responseDecodable<T>(queue: DispatchQueue?, decoder: DataDecoder, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self where T : Decodable {
        
        let dataResponse: DataResponse<T> = self.responseModelResult as! DataResponse<T>
        completionHandler(dataResponse)
        return self
    }
    
    
}
