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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResponseDecodableSuccessFlow() {
       
        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
        
        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            switch response.result {
            case .success(let todoDTO):
                XCTAssertTrue(todoDTO.id == 1)
                XCTAssertTrue(todoDTO.title == "mockTitle")
                XCTAssertTrue(todoDTO.userId == 1)
                XCTAssertTrue(todoDTO.completed == true)
            case .failure( _):
               XCTFail()
            }
           
        }
    }
    
    func testResponseDecodableFailureFlowWithMissingUrl() {

       let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelFailureStubWithMissingUrl)

        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
                switch response.result {
                case .success( _):
                    XCTFail()
                case .failure(let error):
                    print(error.localizedDescription == "URL request to encode was missing a URL")
                }

        }
    }
        func testResponseDecodableFailureFlowWithUrlComponetsFailed() {
            let error = NSError(domain:NSURLErrorDomain, code:NSURLErrorUnknown, userInfo:nil)
            let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
                                                                          result:.failure(AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))))
            let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
            
            mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
                switch response.result {
                case .success( _):
                    XCTFail()
                case .failure(let error):
                    XCTAssertTrue(error.localizedDescription == "JSON could not be encoded because of error:\nThe operation couldn’t be completed. (NSURLErrorDomain error -1.)")

                }
                
            }
    }
    func testResponseDecodableFailureFlowWithMissingRequiredComponent() {
    
        let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
                                                                    result:.failure(AFError.parameterEncoderFailed(reason: .missingRequiredComponent(.url))))
        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
        
        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            switch response.result {
            case .success( _):
                XCTFail()
            case .failure(let error):
                XCTAssertTrue(error.localizedDescription == "Encoding failed due to a missing request component: url")
                
            }
            
        }
    }
    
    func testResponseDecodableFailureFlowWithParamaterEncoderFailed() {
        let error = NSError(domain:NSURLErrorDomain, code:NSURLErrorUnknown, userInfo:nil)
        let responseModelSuccessStub = DataResponse<DTO.TodoDTO>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23,
                                                                      result:.failure(AFError.parameterEncoderFailed(reason: .encoderFailed(error: error))))
        let mockClass = DecodableRequestMockClass<DTO.TodoDTO>(responseModelSuccessStub)
        
        mockClass.responseDecodable { ( response: DataResponseModel<DTO.TodoDTO>) in
            switch response.result {
            case .success( _):
                XCTFail()
            case .failure(let error):
                XCTAssertTrue(error.localizedDescription == "The underlying encoder failed with the error: Error Domain=NSURLErrorDomain Code=-1 \"(null)\"")
                
            }
            
        }
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
