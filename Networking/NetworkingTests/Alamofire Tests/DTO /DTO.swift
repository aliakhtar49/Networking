//
//  DTO.swift
//  NetworkingTests
//
//  Created by Ali Akhtar on 05/04/2019.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//



import Foundation


struct DTO {
    
    /// The TodoDTO Model Used in Stub.
    ///
    /// - userId:                 Int
    /// - id:                     Int
    /// - title                   String
    /// - completed               Bool
    ///
    struct TodoDTO: Codable {
        var userId: Int
        var id: Int
        var title: String
        var completed: Bool
    }
}
