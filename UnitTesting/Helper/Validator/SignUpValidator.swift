//
//  SignUpValidator.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 10/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

class SignUpValidator: SignUpValidatorProtocol {
    
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
    
    func isEmailValid(email: String) -> Bool {
        let isValid = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
        if email.isEmpty || !isValid {
            return false
        } else {
            return true
        }
    }
    
    func isPasswordValid(password: String) -> Bool {
        if password.count > 5 && password.count < 16 {
            return true
        } else {
            return false
        }
    }
    
    func isPasswordMatched(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
