//
//  MockBaseDataStore.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 07/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
@testable import Networking

class MockBaseDataStore {
    
    let networking: AlamofireManager
    
    
    init() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        networking = AlamofireManager(configuration: configuration, requestGenerator: AlamofireRequestGenerator())
    }
}
