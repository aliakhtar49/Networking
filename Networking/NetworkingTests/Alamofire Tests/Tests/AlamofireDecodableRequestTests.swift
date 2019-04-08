//
//  AlamofireDecodableRequestTests.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import XCTest
@testable import Networking
import Alamofire


class AlamofireDecodableRequestTests: XCTestCase {
    
   

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testResponseDecodableSuccessFlow() {
//       
//        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
//        
//        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//            switch response.result {
//            case .success(let todoDTO):
//                XCTAssertTrue(todoDTO.id == 1)
//                XCTAssertTrue(todoDTO.title == "mockTitle")
//                XCTAssertTrue(todoDTO.userId == 1)
//                XCTAssertTrue(todoDTO.completed == true)
//            case .failure( _):
//               XCTFail()
//            }
//           
//        }
//    }
//   
//    
//    func testResponseDecodableFailureFlowWithMissingUrl() {
//
//       let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelFailureStubWithMissingUrl)
//
//        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//                switch response.result {
//                case .success( _):
//                    XCTFail()
//                case .failure(let error):
//                    print(error.localizedDescription == "URL request to encode was missing a URL")
//                }
//
//        }
//    }
//        func testResponseDecodableFailureFlowWithUrlComponetsFailed() {
//            let error = NSError(domain:NSURLErrorDomain, code:NSURLErrorUnknown, userInfo:nil)
//            let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
//                                                                          result:.failure(AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))))
//            let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
//            
//            mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//                switch response.result {
//                case .success( _):
//                    XCTFail()
//                case .failure(let error):
//                    XCTAssertTrue(error.localizedDescription == "JSON could not be encoded because of error:\nThe operation couldn’t be completed. (NSURLErrorDomain error -1.)")
//
//                }
//                
//            }
//    }
//    func testResponseDecodableFailureFlowWithMissingRequiredComponent() {
//    
//        let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
//                                                                    result:.failure(AFError.parameterEncoderFailed(reason: .missingRequiredComponent(.url))))
//        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
//        
//        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//            switch response.result {
//            case .success( _):
//                XCTFail()
//            case .failure(let error):
//                XCTAssertTrue(error.localizedDescription == "Encoding failed due to a missing request component: url")
//                
//            }
//            
//        }
//    }
//    
//    func testResponseDecodableFailureFlowWithParamaterEncoderFailed() {
//        let error = NSError(domain:NSURLErrorDomain, code:NSURLErrorUnknown, userInfo:nil)
//        let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
//                                                                      result:.failure(AFError.parameterEncoderFailed(reason: .encoderFailed(error: error))))
//        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
//        
//        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//            switch response.result {
//            case .success( _):
//                XCTFail()
//            case .failure(let error):
//                XCTAssertTrue(error.localizedDescription == "The underlying encoder failed with the error: Error Domain=NSURLErrorDomain Code=-1 \"(null)\"")
//                
//            }
//            
//        }
//    }
//    
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    //Test ResponseDecodable method case when server sends proper json decodable response
    func testResponseDecodableSuccessCase(){
        
        MockURLProtocol.requestHandler =  { request in
            XCTAssertEqual(request.url?.path.contains("todos"), true)
            return (HTTPURLResponse(), mockJSONDataForDecodableSuccessCase,nil)
        }
        let expectation = XCTestExpectation(description: "response")
        
        let router = URLRouters.ToDo.get()
        let request = MockConfiguration.mockAlamofireManager.response(router)
        
        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            switch response.result {
            case .success(let toDoDTO):
                XCTAssertTrue(toDoDTO.title == "delectus aut autem","Decoding Json should success")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail("Decoding Json should success")
            }
            
        }
        wait(for: [expectation], timeout: 10)
    }
    
    //Test ResponseDecodable method case when server Json response can't be decodable
    func testResponseDecodableFailureFlowWithJsonDecodingFailed(){
        let mockJSONData = "{\"userId\": 1,\"id\": 1,title\": \"delectus aut autem\",\"completed\": false}".data(using: .utf8)!
        MockURLProtocol.requestHandler =  { request in
            XCTAssertEqual(request.url?.path.contains("todos"), true)
            return (HTTPURLResponse(), mockJSONData,nil)
        }
        let expectation = XCTestExpectation(description: "response")
        
        let router = URLRouters.ToDo.get()
        let request = MockConfiguration.mockAlamofireManager.response(router)
        
        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            
            if case let .failure(error) = response.result {
                XCTAssertTrue(error.localizedDescription == "Response could not be decoded because of error:\nThe data couldn’t be read because it isn’t in the correct format.","JsonDecoding Shhould Failed")
                expectation.fulfill()
            }else {
                XCTFail("JsonDecoding Should Failed")
            }
        }
        wait(for: [expectation], timeout: 10)
    }
    
    
    //Test ResponseDecodable method case when server sends empty response
    func testResponseDecodableFailureFlowWithEmptyResponseFailed(){
        let mockJSONData = Data()
        MockURLProtocol.requestHandler =  { request in
            XCTAssertEqual(request.url?.path.contains("todos"), true)
            return (HTTPURLResponse(), mockJSONData,nil)
        }
        let expectation = XCTestExpectation(description: "response")
        
        let router = URLRouters.ToDo.get()
        let request = MockConfiguration.mockAlamofireManager.response(router)
        
        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            
            if case let .failure(error) = response.result {
                XCTAssertTrue(error.localizedDescription == "Response could not be serialized, input data was nil or zero length.","Response Data Should not be nil")
                expectation.fulfill()
            }else {
                XCTFail("Response Data Should not be nil")
            }
        }
        wait(for: [expectation], timeout: 10)
    }
    
    
    //Request Creation Cases (Before Hit to Server)
    func testResponseDecodableFailureFlowWithRequestCancelled(){
    
        let expectation = XCTestExpectation(description: "response")
        
        let router = URLRouters.ToDo.get()
        let request = MockConfiguration.mockAlamofireManager.response(router)
        request.cancel()
        
        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            
            if case let .failure(error) = response.result {
                XCTAssertTrue(error.localizedDescription == "Request explicitly cancelled.","Request Should be cancelled")
                expectation.fulfill()
            }else {
                XCTFail("Response Data Should not be nil")
            }
        }
        wait(for: [expectation], timeout: 10)
    }
    func testResponseDecodableFailureFlowWithInvalidUrl(){
        
        let expectation = XCTestExpectation(description: "response")
        
        let router = URLRouters.EmptyRouter.get()
        let request = MockConfiguration.mockAlamofireManager.response(router)
        
        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            
            if case let .failure(error) = response.result {
                XCTAssertTrue(error.localizedDescription == "URL is not valid: ","Url should be marked as invalid")
                expectation.fulfill()
            }else {
                XCTFail("Url should be marked as invalid")
            }
        }
        wait(for: [expectation], timeout: 10)
    }
    
//    func testResponseDecodableFailureFlowWithInvalidUrlOne(){
//        
//        let expectation = XCTestExpectation(description: "response")
//        
//        
//        let router = URLRouters.UrlNotFoundRouter.get()
//        let request = MockConfiguration.mockAlamofireManager.response(router)
//        
//        request.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
//            
//            if case let .failure(error) = response.result {
//                print(error.localizedDescription)
//                XCTAssertTrue(error.localizedDescription == "URL is not valid: ","Url should be marked as invalid")
//                expectation.fulfill()
//            }else {
//                XCTFail("Url should be marked as invalid")
//            }
//        }
//        wait(for: [expectation], timeout: 60)
//    }

}
