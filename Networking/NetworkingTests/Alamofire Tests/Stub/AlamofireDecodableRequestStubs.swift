//
//  AlamofireDecodableRequestStubs.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire
@testable import Networking


let todoStubModel = DTO.TodoDTO(userId: 1, id: 1, title: "mockTitle", completed: true)
let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23, result:.success(todoStubModel))

let responseModelFailureStubWithMissingUrl = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23, result:.failure(AFError.parameterEncodingFailed(reason: .missingURL)))
