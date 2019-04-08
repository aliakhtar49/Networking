//
//  DecodableRequestMockClass.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
@testable import Networking
import Alamofire

class DecodableRequestMockClass<T>: DecodableRequest {

    var responseModelResult: (DataResponse<T>)

    init(_ dataResponse: DataResponse<T> ) {
        self.responseModelResult = dataResponse
    }

    func responseDecodable<T>(completionHandler: @escaping (DataResponseModel<T>) -> Void) where T : Decodable, T : Encodable {

        let response: DataResponse<T> = responseModelResult as! DataResponse<T>
        let dataRequestMockClass : DataRequestMockClass<T> = DataRequestMockClass(response)
        dataRequestMockClass.responseDecodable(queue: nil, decoder: JSONDecoder()) { (dataResponse : DataResponse<T>) in
            completionHandler(self.convertResponseToDataResponseModel(dataResponse: dataResponse))
        }
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
    

    func cancel() {

    }

    func validate(validationType: ValidationType) {

    }


}
