//
//  MockConfiguration.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 08/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
@testable import Networking

struct MockConfiguration {
    
    static let mockAlamofireManager: AlamofireManager = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let manager = AlamofireManager(configuration: configuration, requestGenerator: AlamofireRequestGenerator())
        return manager
    }()
    
}

