//
//  ReadableTests.swift
//  NetworkingTests
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import XCTest
@testable import Networking
@testable import Alamofire


class ReadableTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    struct User: Readable {
        var route: String = "users/registration"
    }
    
    func testBasicReadableRouter() {
        
        let router = User.get()
        let responseModelResult = DataResponse<Int>.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 23, result:Result.init(value: 2, error: nil))

      //  Xctest
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
