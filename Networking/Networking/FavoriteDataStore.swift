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
    
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

final class FavoriteDataStore: BaseDataStore {}

extension FavoriteDataStore: FavoriteDataStoreProtocol {
    
    
    func getFavorites(params: [String: String], completion: @escaping (ResultType<FavoriteDTO>) -> Void) {
        
        let router = URLRouters.Favorites.get()
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


struct ToDoDTO: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
struct PostDTO: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
final class TestingClass: BaseDataStore {}
protocol TestingProtocol: DataResponseable {
    func getTodos(params: [String: String], completion: @escaping (ResultType<ToDoDTO>) -> Void)
    func getPosts(params: [String: String], completion: @escaping (ResultType<[PostDTO]>) -> Void)
}
extension TestingClass: TestingProtocol {
    func getTodos(params: [String : String], completion: @escaping (ResultType<ToDoDTO>) -> Void) {
        let router = URLRouters.ToDo.get()
        let request = networking.response(router)
        request.responseDecodable { ( response: DataResponseModel<ToDoDTO>) in
            switch response.result {
            case .success(let toDoDTO):
                print(toDoDTO.title)
                completion(.success(toDoDTO))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    func getPosts(params: [String : String], completion: @escaping (ResultType<[PostDTO]>) -> Void) {
        let router = URLRouters.Post.get()
        let request = networking.response(router)
        
        request.responseDecodable { ( response: DataResponseModel<[PostDTO]>) in
            switch response.result {
            case .success(let postDTO):
                print(postDTO[0].body)
                completion(.success(postDTO))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    
}
