////
////  AlamofireDecodableRequestIntegrationTests.swift
////  NetworkingTests
////
////  Created by Ali Akhtar on 07/04/2019.
////  Copyright © 2019 FaizanEllahi. All rights reserved.
////
//
//import XCTest
//@testable import Networking
//
//class AlamofireDecodableRequestIntegrationTests: XCTestCase {
//
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
////    func testExpam() {
////        let configuration = URLSessionConfiguration.ephemeral
////        configuration.protocolClasses = [MockURLProtocol.self]
////        let networking = AlamofireManager(configuration: configuration, requestGenerator: AlamofireRequestGenerator())
////        let router = URLRouters.ToDo.get()
////        let request = networking.response(router)
////        request.responseDecodable { ( response: DataResponseModel<ToDoDTO>) in
////            switch response.result {
////            case .success(let toDoDTO):
////                print(toDoDTO.title)
////                completion(.success(toDoDTO))
////            case .failure(let error):
////                print(error.localizedDescription)
////                completion(.failure(error))
////            }
////            
////        }
////    }
//
//    func testJsonDecodableSuccess() {
//        
//        let mockJSONData = "{\"userId\": 1,\"id\": 1,\"title\": \"delectus aut autem\",\"completed\": false}".data(using: .utf8)!
//        MockURLProtocol.requestHandler =  { request in
//         XCTAssertEqual(request.url?.path.contains("todos"), true)
//            return (HTTPURLResponse(), mockJSONData)
//        }
//        let expectation = XCTestExpectation(description: "response")
//        let testingMockingclass = IntegrationTestingClassMock()
//        testingMockingclass.getTodos(params: [:]) { (result) in
//            if case let .success(todos) = result {
//                 XCTAssertTrue(todos.title == "delectus aut autem","Decoding Json should success")
//                expectation.fulfill()
//            }else {
//                XCTFail("Decoding Json should success")
//            }
//        }
//        wait(for: [expectation], timeout: 10)
//    }
//    func testJsonDecodingFailed() {
//        
//        let mockJSONData = "{\"userId\": 1,\"id\": 1,title\": \"delectus aut autem\",\"completed\": false}".data(using: .utf8)!
//        MockURLProtocol.requestHandler =  { request in
//            XCTAssertEqual(request.url?.path.contains("todos"), true)
//            return (HTTPURLResponse(), mockJSONData)
//        }
//        let expectation = XCTestExpectation(description: "response")
//        let testingMockingclass = IntegrationTestingClassMock()
//        testingMockingclass.getTodos(params: [:]) { (result) in
//            
//            if case let .failure(error) = result {
//                XCTAssertTrue(error.localizedDescription == "Response could not be decoded because of error:\nThe data couldn’t be read because it isn’t in the correct format.","JsonDecoding Shhould Failed")
//                expectation.fulfill()
//            }else {
//                XCTFail("JsonDecoding Shhould Failed")
//            }
//        }
//        wait(for: [expectation], timeout: 10)
//    }
//    func testInvalidEmptyResponse() {
//        
//        let mockJSONData = Data()
//        MockURLProtocol.requestHandler =  { request in
//            XCTAssertEqual(request.url?.path.contains("todos"), true)
//            return (HTTPURLResponse(), mockJSONData)
//        }
//        let expectation = XCTestExpectation(description: "response")
//        let testingMockingclass = IntegrationTestingClassMock()
//        testingMockingclass.getTodos(params: [:]) { (result) in
//            
//            if case let .failure(error) = result {
//                XCTAssertTrue(error.localizedDescription == "Response could not be serialized, input data was nil or zero length.","Response Data Should not be nil")
//                expectation.fulfill()
//            }else {
//                XCTFail("Response Data Should not be nil")
//            }
//        }
//        wait(for: [expectation], timeout: 10)
//    }
//    
//    
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
