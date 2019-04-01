//
//  DownloadableRequest.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/1/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


typealias DownloadResponseClosure = (DownloadResponse) -> Void
typealias DownloadProgressClosure = (Double) -> Void



protocol DownloadableRequest: CancelableRequest {
    func response(completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure)
    func resume(data: Data, completion: @escaping DownloadResponseClosure, progress: @escaping DownloadProgressClosure)
}


protocol DownloadResponse {
    var destinationURL: URL? { get }
    var resumeData: Data? { get }
    var error: Error? { get }
}
