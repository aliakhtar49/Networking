//
//  ReadableTests.swift
//  NetworkingTests
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import XCTest
@testable import Networking

/// Class to test the functionality of the **Readable** protocol.
class ReadableTests: XCTestCase {
    
    /// User router to test the functionality of **Readable** protocol.
    struct User: Readable {
        var route: String = "users/registration"
    }
    
    /// Function to test the HTTP Method type of **Readable** router.
    func testReadableRouterMethod() {
        
        let router = User.get()
    
        XCTAssertEqual(router.method, .get)
        XCTAssertNotEqual(router.method, .post)
        XCTAssertNotEqual(router.method, .put)
        XCTAssertNotEqual(router.method, .delete)
        XCTAssertNotEqual(router.method, .patch)
    }
    
    /// Function to test the value of default paramerts in the get request of **Readable** protocol.
    func testBasicReadableRouter() {
        
        let router = User.get()
        let params: Parameters = [:]
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters) , NSDictionary(dictionary:params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom paramerts in get request of **Readable** protocol.
    func testReadableRouterWithParams() {
        
        let params: Parameters = ["ID": "7",
                      "Name": "NetworkingTest"]
        let router = User.get(parameters: params)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom headers in get request of **Readable** protocol.
    func testReadableRouterWithHeaders() {
        
        let params: Parameters = [:]
        let headers: Headers = ["device" : "iOS"]
        let router = User.get(headers: headers)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom timeout in get request of **Readable** protocol.
    func testReadableRouterWitTimeout() {
        
        let params: Parameters = [:]
        let router = User.get(timeout: 15.0)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 15.0)
    }
    
    /// Function to test the value of custom retry in get request of **Readable** protocol.
    func testReadableRouterWitRetry() {
        
        let params: Parameters = [:]
        let router = User.get(retry: 3)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 3)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of parameters, headers, timeout and retry in get request of **Readable** protocol.
    func testReadableRouterWithParamsHeadersTimeoutRetry() {
        
        let params: Parameters = ["ID": "7",
                                  "Name": "NetworkingTest"]
        let headers: Headers = ["device" : "iOS"]
        let router = User.get(parameters: params, headers: headers, timeout: 30.0, retry: 2)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .get)
        XCTAssertEqual(router.retry, 2)
        XCTAssertEqual(router.timeout, 30.0)
    }
}
