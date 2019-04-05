//
//  NetworkManager.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation


final class NetworkManager {
    
    
    // MARK:- Properties
    
    
    /// A shared instance of `NetworkManager`.
    public static let shared = NetworkManager()
    
    
    /// An immutable instance of Networking
    let manager: Networking
    
    
    
    // MARK: - Lifecycle

    
    /// Creates an instance with the specified `configuration`
    
    /// - Parameter configuration:            The configuration used to construct the managed session.
    ///                                       `URLSessionConfiguration.default` by default.
    ///
    /// - Returns:                             The new `NetworkManager` instance.
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        
        manager = AlamofireManager(configuration: configuration)
    }
    
    
    
    // MARK: - Methods

    
    
    /// Creates a `DecodableRequest` to retreive the contents of specified `RequestConvertible`
    ///
    /// - Parameter urlRequest:            The `RequestConvertible`.
    ///
    /// - Returns:                             The created `DecodableRequest`.
    
    func response(_ urlRequest: RequestConvertible) -> DecodableRequest {
        
        return manager.response(urlRequest)
    }
    

    
    func update(withHeaders headers: Headers) {
        
        return manager.update(withHeaders: headers)
    }
    
    
    
    /// Creates a `DownloadableRequest` to retreive the contents of specified `RequestConvertible`
    ///
    /// - Parameter urlRequest:            The `RequestConvertible`.
    ///
    /// - Returns:                             The created `DownloadableRequest`.
    
    func download(_ urlRequest: RequestConvertible) -> DownloadableRequest {
        
        return manager.download(urlRequest)
    }
    
    
    
    /// Creates a `UploadableRequest` to upload the contents of specified `URL`
    ///
    /// - Parameter url:            The `URL`.
    /// - Parameter urlRequest:     The `RequestConvertible`.
    ///
    /// - Returns:                  The created `UploadableRequest`.
    
    func upload(file url: URL, with urlRequest: RequestConvertible) -> UploadableRequest {
        
        return manager.upload(file: url, with: urlRequest)
    }
    
}
