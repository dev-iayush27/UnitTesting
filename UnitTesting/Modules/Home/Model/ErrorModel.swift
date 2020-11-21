//
//  ErrorModel.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 19/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

enum ErrorModel: LocalizedError, Equatable {
    
    case failedRequest(description: String)
    case responseParsingError
    case invalidRequestURLStringError
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .responseParsingError:
            return "Error while Parsing Json data."
        case .invalidRequestURLStringError:
            return "Request URL is invalid or empty."
        }
    }
}
