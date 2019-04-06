//
//  CreatableTests.swift
//  NetworkingTests
//
//  Created by Faizan Ellahi on 4/4/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import XCTest
@testable import Networking

/// Class to test the functionality of the **Creatable** protocol.
class CreatableTests: XCTestCase {
    
    /// User router to test the functionality of **Creatable** protocol.
    struct User: Creatable {
        var route: String = "users/registration"
    }
    
    /// Function to test the HTTP Method type of **Creatable** router.
    func testReadableRouterMethod() {
        
        let router = User.create()
        
        XCTAssertEqual(router.method, .post)
        XCTAssertNotEqual(router.method, .get)
        XCTAssertNotEqual(router.method, .put)
        XCTAssertNotEqual(router.method, .delete)
        XCTAssertNotEqual(router.method, .patch)
    }
    
    /// Function to test the value of default paramerts in the get request of **Creatable** protocol.
    func testBasicReadableRouter() {
        
        let router = User.create()
        let params: Parameters = [:]
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters) , NSDictionary(dictionary:params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom paramerts in get request of **Creatable** protocol.
    func testReadableRouterWithParams() {
        
        let params: Parameters = ["ID": "7",
                                  "Name": "NetworkingTest"]
        let router = User.create(parameters: params)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom headers in get request of **Creatable** protocol.
    func testReadableRouterWithHeaders() {
        
        let params: Parameters = [:]
        let headers: Headers = ["device" : "iOS"]
        let router = User.create(headers: headers)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of custom timeout in get request of **Creatable** protocol.
    func testReadableRouterWitTimeout() {
        
        let params: Parameters = [:]
        let router = User.create(timeout: 15.0)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 1)
        XCTAssertEqual(router.timeout, 15.0)
    }
    
    /// Function to test the value of custom retry in get request of **Creatable** protocol.
    func testReadableRouterWitRetry() {
        
        let params: Parameters = [:]
        let router = User.create(retry: 3)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(router.headers, nil)
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 3)
        XCTAssertEqual(router.timeout, 60.0)
    }
    
    /// Function to test the value of parameters, headers, timeout and retry in get request of **Creatable** protocol.
    func testReadableRouterWithParamsHeadersTimeoutRetry() {
        
        let params: Parameters = ["ID": "7",
                                  "Name": "NetworkingTest"]
        let headers: Headers = ["device" : "iOS"]
        let router = User.create(parameters: params, headers: headers, timeout: 30.0, retry: 2)
        
        XCTAssertEqual(router.route, "users/registration")
        XCTAssertEqual(NSDictionary(dictionary: router.parameters), NSDictionary(dictionary: params))
        XCTAssertEqual(NSDictionary(dictionary: router.headers!), NSDictionary(dictionary: headers!))
        XCTAssertEqual(router.method, .post)
        XCTAssertEqual(router.retry, 2)
        XCTAssertEqual(router.timeout, 30.0)
    }
}

