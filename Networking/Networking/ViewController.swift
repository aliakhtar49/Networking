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
//    struct RecipeImageRoute: Readable {
////        var route: String = "https://www.themealdb.com/images/ingredients/Lime-Small.png"
//        var route: String = "https://api.imgur.com/3/image"
//    }
    struct RecipeImageRoute: Creatable {
        //        var route: String = "https://www.themealdb.com/images/ingredients/Lime-Small.png"
        var route: String = "https://api.imgur.com/3/image"
    }
    lazy var alamofireManager: AlamofireManager = {
        return AlamofireManager()
    }()
    
   
//    func getPostRequest(){
//
//        let imageData = UIImageJPEGRepresentation(#imageLiteral(resourceName: "imageOne.png"), 0.7)
//        let url = "https://api.imgur.com/3/image"
//        let parameters = ["name":"MyTestFile2322","description":"My tutorial ali"]
//        let headers: HTTPHeaders = [
//            "Content-type" : "multipart/form-data",
//            "Authorization" :"Client-ID 069a85e0658cde5"
//        ]
//        AAManager.init().upload(multipartFormData: { (multipartFormData) in
//            for(key,value) in parameters {
//                multipartFormData.append(with: key, and: value)
//            }
//            if let data = imageData{
//                multipartFormData.append(data, withName: "image", fileName:"image.png", mimeType:"image/png")
//            }
//            multipartFormData.finalizebody()
//        }, to: url, method: .post, headers: headers) { (data, response, error) in
//
//            if let response = response {
//                print(response)
//            }
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//                }catch {
//                    print(error)
//                }
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let parameters = ["name":"MyTestFile2322","description":"My tutorial ali"]
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 069a85e0658cde5",
            "Content-type" : "multipart/form-data"
        ]
        let headersCustom: [String:String] = [
            "Authorization": "Client-ID 069a85e0658cde5",
            "Content-type" : "multipart/form-data"
        ]
        
        let image = UIImage(named: "imageOne")!
        let imgData = image.jpegData(compressionQuality: 0.75)
        let path = Bundle.main.path(forResource: "imageOne", ofType: "png")
        let url = URL(string: path!)
        let requestConvertible = RecipeImageRoute.create(parameters: parameters, headers:headersCustom)
        let downloadRequest = alamofireManager.upload(mulitpart: MultipartFormData(provider: .data(imgData!), name: "image"), with: requestConvertible)
        downloadRequest.response { (dataResponse) in
            print(dataResponse.data)
             print(dataResponse.error)
        }
       
       
//        let downloadRequest = alamofireManager.upload(file: url!, with: requestConvertible)
//
//        downloadRequest.response { (response) in
//
//        }
//        let image = UIImage(named: "imageOne")!
//        let imgData = image.jpegData(compressionQuality: 0.75)
       
        
       
//        AF.upload(multipartFormData: { (mutlipartForm) in
//            for (key, value) in parameters {
//                mutlipartForm.append(value.data(using: .utf8)!, withName: key)
//
//            }
//            mutlipartForm.append(imgData!, withName: "image")
//
//        }, to: "https://api.imgur.com/3/image",headers:headers).response { (dataResponse) in
//            print(dataResponse.data)
//            print(dataResponse.error)
//        }
//
//        AF.upload(
//            multipartFormData: { multipartFormData in
//                multipartFormData.append(unicornImageURL, withName: "unicorn")
//                multipartFormData.append(rainbowImageURL, withName: "rainbow")
//        },
//            to: "https://httpbin.org/post",
//            encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        debugPrint(response)
//                    }
//                case .failure(let encodingError):
//                    print(encodingError)
//                }
//        }
//        )
        
//        AF.upload(multipartFormData: { multipartFormData in
//            if let imageData = UIImageJPEGRepresentation(image, 1) {
//                multipartFormData.append(imageData, withName: "file", fileName: "file.png", mimeType: "image/png")
//            }
//
//            for (key, value) in parameters {
//                multipartFormData.append((value?.data(using: .utf8))!, withName: key)
//            }}, to: "upload_url", method: .post, headers: ["Authorization": "auth_token"],
//                encodingCompletion: { encodingResult in
//                    switch encodingResult {
//                    case .success(let upload, _, _):
//                        upload.response { [weak self] response in
//                            guard let strongSelf = self else {
//                                return
//                            }
//                            debugPrint(response)
//                        }
//                    case .failure(let encodingError):
//                        print("error:\(encodingError)")
//                    }
//        })
    }
        
        
        
        
        
        //1st task -->  request creation
//        guard let gitUrl = URL(string: "https://api.github.com/users/aliakhtar49") else { return }
//
//        let requestConvertible = RecipeImageRoute.get()
//        let downloadRequest = alamofireManager.download(requestConvertible)
//        downloadRequest.response { (response) in
//            if let destinationURL = response.destinationURL {
//
//                                do {
//                                    let imageData = try Data(contentsOf: destinationURL)
//                                    let image = UIImage(data: imageData)
//                                    print(image as Any)
//                                }
//                                catch {
//                                    print(error.localizedDescription)
//                                }
//
//                            }
//                            else if let resumeData = response.resumeData {
//                                print(resumeData)
//                            }
//                            else if let error = response.error {
//                                print(error.localizedDescription)
//                            }
//                            else {
//                                print("Something went wrong")
//                            }
//        }

        

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
//        let urlString = "https://jsonplaceholder.typicode.com/posts"
////
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
//        let parameters = ["foo": ["a", 1, true]]
//        AF.request(urlString, method: .post, parameters:parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//            switch response.result {
//            case .success:
//                print(response)
//
//                break
//            case .failure(let error):
//
//                print(error.localizedDescription)
//            }
//        }
//
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


