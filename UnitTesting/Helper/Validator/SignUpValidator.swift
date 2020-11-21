//
//  SignUpValidator.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 10/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

class SignUpValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        if firstName.count > 0 && firstName.count < 15 {
            return true
        } else {
            return false
        }
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        if lastName.count > 0 && lastName.count < 15 {
            return true
        } else {
            return false
        }
    }
}
