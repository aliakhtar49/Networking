//
//  UploadableRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


typealias UploadResponseClosure = (UploadResponse) -> Void
typealias UploadProgressClosure = (Double) -> Void



protocol UploadableRequest: Request {
    func response(completion: @escaping UploadResponseClosure)
    func progress(_ progress: @escaping UploadProgressClosure)
}

protocol UploadResponse {
    var data: Data? { get }
    var error: Error? { get }
}
