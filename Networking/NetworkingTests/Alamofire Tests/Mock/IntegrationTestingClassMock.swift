//
//  IntegrationTestingClassMock.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 07/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
@testable import Networking


final class IntegrationTestingClassMock: MockBaseDataStore {}
extension IntegrationTestingClassMock: TestingProtocol {
    func getPosts(params: [String : String], completion: @escaping (ResultType<[PostDTO]>) -> Void) {
    }
    
    func getTodos(params: [String : String], completion: @escaping (ResultType<ToDoDTO>) -> Void) {
        let router = URLRouters.ToDo.get()
        let request = networking.response(router)
        request.responseDecodable { ( response: DataResponseModel<ToDoDTO>) in
            completion(response.result)
        }
    }
}
