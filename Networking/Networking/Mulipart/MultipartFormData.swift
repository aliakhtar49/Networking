//
//  MultipartFormData.swift
//  Networking
//
//  Created by Ali Akhtar on 09/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation

struct MultipartFormData {
    
    /// Method to provide the form data.
    public enum FormDataProvider {
        case data(Foundation.Data)
    }
    
    public init(provider: FormDataProvider, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.provider = provider
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
    
    /// The method being used for providing form data.
    public let provider: FormDataProvider
    
    /// The name.
    public let name: String
    
    /// The file name.
    public let fileName: String?
    
    /// The MIME type
    public let mimeType: String?
    
}
