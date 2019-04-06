//
//  PatchableTests.swift
//  NetworkingTests
//
//  Created by Faizan Ellahi on 4/4/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import XCTest
@testable import Networking

/// Class to test the functionality of the **Patchable** protocol.
class PatchableTests: XCTestCase {
    
    /// User router to test the functionality of **Patchable** protocol.
    struct User: Patchable {
        var route: String = "users/registration"
    }
    
    /// Function to test the HTTP Method type of **Patchable** router.
    func testReadableRouterMethod() {
        
        let router = User.patch()
        
        XCTAssertEqual(router.method, .patch)
        XCTAssertNotEqual(router.method, .post)
        XCTAssertNotEqual(router.method, .put)
        XCTAssertNotEqual(router.method, .delete)
        XCTAssertNotEqual(router.method, .get)
    }
    
    /// Function to test the value of default paramerts in the get request of **Patchable** protocol.
    func testBasicReadableRouter() {
        
        let router = User.patch()
        let params: Parameters = [:]
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters) , NSDictionary(dictionary:params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom paramerts in get request of **Patchable** protocol.
    func testReadableRouterWithParams() {
        
        let params: Parameters = ["ID": "7",
                                  "Name": "NetworkingTest"]
        let router = User.patch(parameters: params)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom headers in get request of **Patchable** protocol.
    func testReadableRouterWithHeaders() {
        
        let params: Parameters = [:]
        let headers: Headers = ["device" : "iOS"]
        let router = User.patch(headers: headers)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom timeout in get request of **Patchable** protocol.
    func testReadableRouterWitTimeout() {
        
        let params: Parameters = [:]
        let router = User.patch(timeout: 15.0)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 15.0)
    }
    
    /// Function to test the value of custom retry in get request of **Patchable** protocol.
    func testReadableRouterWitRetry() {
        
        let params: Parameters = [:]
        let router = User.patch(retry: 3)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 3)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of parameters, headers, timeout and retry in get request of **Patchable** protocol.
    func testReadableRouterWithParamsHeadersTimeoutRetry() {
        
        let params: Parameters = ["ID": "7",
                                  "Name": "NetworkingTest"]
        let headers: Headers = ["device" : "iOS"]
        let router = User.patch(parameters: params, headers: headers, timeout: 30.0, retry: 2)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .patch)
        XCTAssertEqual(router.retry, 2)
        XCTAssertEqual(router.timeout, 30.0)
    }
}

