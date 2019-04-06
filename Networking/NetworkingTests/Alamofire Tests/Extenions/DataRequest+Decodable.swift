//
//  DataRequest+Decodable.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
@testable import Networking
@testable import Alamofire



protocol DataRequestTestableProtocol {
    func responseDecodable<T: Decodable>(queue: DispatchQueue?,
                                         decoder: DataDecoder,
                                         completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
}


extension DataRequest: DataRequestTestableProtocol { }

