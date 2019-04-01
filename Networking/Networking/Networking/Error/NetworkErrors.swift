//
//  NetworkErrors.swift
//  Networking
//
//  Created by Faizan Ellahi on 3/27/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation

public enum NetworkErrors: Error {
    
    /// The underlying reason the parameter encoding error occurred.
    ///
    /// - missingURL:                 The URL request did not have a URL to encode.
    /// - jsonEncodingFailed:         JSON serialization failed with an underlying system error during the
    ///                               encoding process.
    /// - propertyListEncodingFailed: Property list serialization failed with an underlying system error during
    ///                               encoding process.
    public enum ParameterEncodingFailureReason {
        case missingURL
        case urlComponetsFailed
        case jsonEncodingFailed(error: Error)
        case propertyListEncodingFailed(error: Error)
    }
    
    /// The underlying reason the response validation error occurred.
    ///
    /// - dataFileNil:             The data file containing the server response did not exist.
    /// - dataFileReadFailed:      The data file containing the server response could not be read.
    /// - missingContentType:      The response did not contain a `Content-Type` and the `acceptableContentTypes`
    ///                            provided did not contain wildcard type.
    /// - unacceptableContentType: The response `Content-Type` did not match any type in the provided
    ///                            `acceptableContentTypes`.
    /// - unacceptableStatusCode:  The response status code was not acceptable.
    public enum ResponseValidationFailureReason {
        case dataFileNil
        case dataFileReadFailed(at: URL)
        case missingHttpResponse
        case missingContentType(acceptableContentTypes: [String])
        case unacceptableContentType(acceptableContentTypes: [String], responseContentType: String)
        case unacceptableStatusCode(code: Int)
    }
    
    /// The underlying reason the response serialization error occurred.
    ///
    /// - inputDataNil:                    The server response contained no data.
    /// - inputDataNilOrZeroLength:        The server response contained no data or the data was zero length.
    /// - inputFileNil:                    The file containing the server response did not exist.
    /// - inputFileReadFailed:             The file containing the server response could not be read.
    /// - stringSerializationFailed:       String serialization failed using the provided `String.Encoding`.
    /// - jsonSerializationFailed:         JSON serialization failed with an underlying system error.
    /// - propertyListSerializationFailed: Property list serialization failed with an underlying system error.
    public enum ResponseSerializationFailureReason {
        case inputDataNil
        case inputDataNilOrZeroLength
        case inputFileNil
        case inputFileReadFailed
        case stringSerializationFailed(encoding: String.Encoding)
        case jsonSerializationFailed(error: Error?)
        case propertyListSerializationFailed(error: Error)
    }
    
    /// The underlying reason the response serialization error occurred.
    ///
    /// - notConnectedToInternet:             Not connected to the internet.
    /// - internationalRoamingOff:            International data roaming turned off.
    /// - notReachedServer:                   Cannot reach the server.
    /// - connectionLost:                     Connection is lost.
    public enum internetConnectionFailureReason {
        case notConnectedToInternet
        case internationalRoamingOff
        case notReachedServer
        case connectionLost
    }
    
    case invalidURL
    case parameterEncodingFailed(reason: ParameterEncodingFailureReason)
    case responseValidationFailed(reason: ResponseValidationFailureReason)
    case responseSerializationFailed(reason: ResponseSerializationFailureReason)
    case internetConnectionFailed(reason: internetConnectionFailureReason)
}

// MARK: - Error Descriptions

extension NetworkErrors: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
            
        case .invalidURL:
            return "URL is not valid"
        case .parameterEncodingFailed(let reason):
            return reason.localizedDescription
        case .responseValidationFailed(let reason):
            return reason.localizedDescription
        case .responseSerializationFailed(let reason):
            return reason.localizedDescription
        case .internetConnectionFailed(let reason):
            return reason.localizedDescription
        }
    }
}

extension NetworkErrors.ParameterEncodingFailureReason {
    
    var localizedDescription: String {
        
        switch self {
            
        case .missingURL:
            return "URL request to encode was missing a URL"
        case .jsonEncodingFailed(let error):
            return "JSON could not be encoded because of error:\n\(error.localizedDescription)"
        case .propertyListEncodingFailed(let error):
            return "PropertyList could not be encoded because of error:\n\(error.localizedDescription)"
        case .urlComponetsFailed:
            return "Unable to create URL components"
        }
    }
}

extension NetworkErrors.ResponseSerializationFailureReason {
    
    var localizedDescription: String {
        
        switch self {
            
        case .inputDataNil:
            return "Response could not be serialized, input data was nil."
        case .inputDataNilOrZeroLength:
            return "Response could not be serialized, input data was nil or zero length."
        case .inputFileNil:
            return "Response could not be serialized, input file was nil."
        case .inputFileReadFailed:
            return "Response could not be serialized, input file could not be read."
        case .stringSerializationFailed(let encoding):
            return "String could not be serialized with encoding: \(encoding)."
        case .jsonSerializationFailed(let error):
            return "JSON could not be serialized because of error:\n\(String(describing: error?.localizedDescription))"
        case .propertyListSerializationFailed(let error):
            return "PropertyList could not be serialized because of error:\n\(error.localizedDescription)"
        }
    }
}

extension NetworkErrors.ResponseValidationFailureReason {
    
    var localizedDescription: String {
        
        switch self {
            
        case .dataFileNil:
            return "Response could not be validated, data file was nil."
        case .dataFileReadFailed(let url):
            return "Response could not be validated, data file could not be read: \(url)."
        case .missingContentType(let types):
            return (
                "Response Content-Type was missing and acceptable content types " +
                "(\(types.joined(separator: ","))) do not match \"*/*\"."
            )
        case .unacceptableContentType(let acceptableTypes, let responseType):
            return (
                "Response Content-Type \"\(responseType)\" does not match any acceptable types: " +
                "\(acceptableTypes.joined(separator: ","))."
            )
        case .unacceptableStatusCode(let code):
            return "Response status code was unacceptable: \(code)."
        case .missingHttpResponse:
            return "Couldn't get HTTP response"
        }
    }
}

extension NetworkErrors.internetConnectionFailureReason {
    
    var localizedDescription: String {
        
        switch self {
            
        case .notConnectedToInternet:
            return "No internet connection available."
        case .internationalRoamingOff:
            return "International data roaming is turned Off"
        case .notReachedServer:
            return "Server is not reached"
        case .connectionLost:
            return "Network Connection Lost"
        }
    }
}
