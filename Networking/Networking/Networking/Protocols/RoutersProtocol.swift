//
//  RoutesProtocol.swift
//  RoutableApp
//
//  Created by Faizan Ellahi on 4/4/18.
//  Copyright © 2016 ChaiOne. All rights reserved.
//
import Foundation

/// These are routes throughout the application.
/// Typically this is conformed to by methods routes.

public typealias Parameters = [String : Any]

public protocol Routable {
    typealias Headers = [String:String]?
    var route: String {get set}
    init()
}

/// Allows a route to perform the `.get` method
public protocol Readable: Routable {}

/// Allows a route to perform the `.post` method
public protocol Creatable: Routable {}

/// Allows a route to perform the `.put` method
public protocol Updatable: Routable {}

/// Allows a route to perform the `.delete` method
public protocol Deletable: Routable {}

/// Allows a route to perform the `.patch` method
public protocol Patchable: Routable {}

extension Routable {

    /// Create instance of Object that conforms to Routable
    init() {
        self.init()
    }
}

/// This define the type of HTTP method used to perform the request
///
/// - post: POST method
/// - put: PUT method
/// - get: GET method
/// - delete: DELETE method
/// - patch: PATCH method
public enum HTTPMethod: String {
    case post    = "POST"
    case put     = "PUT"
    case get     = "GET"
    case delete  = "DELETE"
    case patch   = "PATCH"
}

public extension Readable {

    /// Method that allows route to return an object
    ///
    /// - Parameter params: Parameters of the object that is being returned
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.get(params: "2")
    ///````
    static func get(parameters: Parameters = [:], headers: Headers = nil, timeout: CFTimeInterval = 15.0, retry: Int = 1) -> RequestConvertible {
        let temp = Self.init()
        let route = "\(temp.route)"
        return RequestConverter(method: .get, route: route, parameters: parameters, headers: headers, timeout: timeout, retry: retry)
    }
}

public extension Creatable {

    /// Method that allows route to create an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.create(parameters: ["username":"initFabian", "github":"https://github.com/initFabian"])
    ///````
    static func create(parameters: Parameters = [:], headers: Headers = nil, timeout: CFTimeInterval = 15.0, retry: Int = 1) -> RequestConvertible {
        let temp = Self.init()
        let route = "\(temp.route)"
        
        return RequestConverter(method: .post, route: route, parameters: parameters, headers: headers, timeout: timeout, retry: retry)
    }
}

public extension Updatable {

    /// Method that allows route to update an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.update(params: "2", parameters: ["twitterURL":"https://twitter.com/initFabian"])
    ///````
    static func update(parameters: Parameters = [:], headers: Headers = nil, timeout: CFTimeInterval = 15.0, retry: Int = 1) -> RequestConvertible {
        let temp = Self.init()
        return RequestConverter(method: .put, route: temp.route, parameters: parameters, headers: headers, timeout: timeout, retry: retry)
    }
}

public extension Patchable {
    
    /// Method that allows route to update an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.update(params: "2", parameters: ["twitterURL":"https://twitter.com/initFabian"])
    ///````
    static func patch(parameters: Parameters = [:], headers: Headers = nil, timeout: CFTimeInterval = 15.0, retry: Int = 1) -> RequestConvertible {
        let temp = Self.init()
        return RequestConverter(method: .patch, route: temp.route, parameters: parameters, headers: headers, timeout: timeout, retry: retry)
    }
}

public extension Deletable {

    /// Method that allows route to delete an object
    ///
    /// - Parameter params: Parameters of the object that is being deleted
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.delete(params: "2")
    ///````
    static func delete(params: String, headers: Headers = nil, timeout: CFTimeInterval = 15.0, retry: Int = 1) -> RequestConvertible {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        
        return RequestConverter(method: .delete, route: route, headers: headers, timeout: timeout, retry: retry)
    }
}

/// Protocol that conforms to URLRequestConvertible to all Alamofire integration
public protocol RequestConvertible {
    var method: HTTPMethod {get set}
    var route: String {get set}
    var parameters: Parameters {get set}
    var headers: [String: String]? {get set}
    var timeout: CFTimeInterval {get set}
    var retry: Int {get set}
}

/// Converter object that will allow us to play nicely with Alamofire
 struct RequestConverter: RequestConvertible {
    public var method: HTTPMethod
    public var route: String
    public var parameters: Parameters = [:]
    public var headers: [String: String]?
    public var timeout: CFTimeInterval
    public var retry: Int
    /// Create a RequestConverter object
    ///
    /// - Parameters:
    ///   - method: Method to perform on router. Example: `.get`, `.post`, etc.
    ///   - route: Route endpoint on url.
    ///   - parameters: Optional dictionary to pass in objects. Used for `.post` and `.put`
    init(method: HTTPMethod, route: String, parameters: Parameters = [:], headers: [String: String]? = nil, timeout: CFTimeInterval, retry: Int) {
        self.method = method
        self.route = route
        self.parameters = parameters
        self.headers = headers
        self.timeout = timeout
        self.retry = retry
    }
}


