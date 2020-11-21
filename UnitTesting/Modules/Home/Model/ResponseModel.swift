//
//  ResponseModel.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 10/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
