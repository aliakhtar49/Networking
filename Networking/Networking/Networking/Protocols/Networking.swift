//
//  Networking.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/27/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation



protocol Networking {
    
    func response(_ urlRequest: RequestConvertible) -> DecodableRequest
    func update(withHeaders headers: Headers)
    func download(_ urlRequest: RequestConvertible, to destinationURL: URL?) -> DownloadableRequest
    func upload(file url: URL, with urlRequest: RequestConvertible) -> UploadableRequest
}
