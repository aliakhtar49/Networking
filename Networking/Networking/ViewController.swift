//
//  ViewController.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/22/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    let favoriteDataStore: FavoriteDataStoreProtocol = FavoriteDataStore()
    let testingdataStore: TestingProtocol = TestingClass()
    let networking = AlamofireManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1st task -->  request creation
        guard let gitUrl = URL(string: "https://api.github.com/users/aliakhtar49") else { return }

        //2ns task --> Url Session Task creation
//        URLSession.shared.dataTask(with: gitUrl) { (data, response
//            , error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            if let data = data {
//                print(data)
//            }
//            if let response = response {
//                print(response)
//            }
//
//            }.cancel()
//        let request: DataRequest = AF.request("https://api.github.com/users/aliakhtar49", method: .post, parameters: ["title": "foo","body":"bar","userId":1],encoding: JSONEncoding.default, headers: nil).responseJSON {
//                    response in
//                    switch response.result {
//                    case .success:
//                        print(response)
//
//                        break
//                    case .failure(let error):
//
//                        print(error)
//                    }
//                }
//
//
//        request.cancel()
//
      

        
        
        
        
        //invalid url
        let urlString = "https://jsonplacehols"
//
//        let router = URLRouters.User.create(parameters: ["title": "foo","body":"bar","userId":1])
//
//        let request = networking.response(router)
//        request.responseDecodable { ( response: DataResponseModel<ToDoDTO>) in
//            switch response.result {
//            case .success(let toDoDTO):
//                print(toDoDTO.title)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//        }
//
        let parameters = ["foo": ["a", 1, true]]
        AF.request(urlString, method: .post, parameters:parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)

                break
            case .failure(let error):

                print(error.localizedDescription)
            }
        }
        
//            testingdataStore.getPosts(params: [:]) { (result) in
//
//            }
//        testingdataStore.getTodos(params: [:]) { (result) in
//            
//        }
//        testingdataStore.getPosts(params: [:]) { (result) in
//
//        }
//        testingdataStore.getTodos(params: [:]) { (result) in
//
//        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        favoriteDataStore.getFavorites(params: [:]) { (result) in
//
//            switch result {
//            case .failure(let error):
//                print(error);
//            case .success(let user):
//                print("user data is \(user)")
//            }
//
//
//        }
    }


}

