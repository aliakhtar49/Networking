//
//  FavoriteDataStore.swift
//  Networking
//
//  Created by Faizan Ellahi on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation

protocol FavoriteDataStoreProtocol: DataResponseable {
    func getFavorites(params: [String: String], completion: @escaping (ResultType<FavoriteDTO>) -> Void)
}

class FavoriteDTO: Codable {
    
    
    
}

final class FavoriteDataStore: BaseDataStore {}

extension FavoriteDataStore: FavoriteDataStoreProtocol {
    
    
    func getFavorites(params: [String: String], completion: @escaping (ResultType<FavoriteDTO>) -> Void) {
        
        let router = URLRouters.Favorites.get(parameters: params)
        let request = networking.response(router)
        
        request.responseDecodable { (response: DataResponseModel<FavoriteDTO>) in
            
            switch response.result {
                
            case .success(let favoriteDTO):
                print("favorite response is \(favoriteDTO)")
                 completion(.success(favoriteDTO))
            case .failure(let error):
                print("request fail \(error)")
                completion(.failure(error))
            }
        }
    }
}
