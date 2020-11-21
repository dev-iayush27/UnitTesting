//
//  SignUpValidatorProtocol.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 21/11/20.
//

import Foundation

protocol SignUpValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func isPasswordMatched(password: String, repeatPassword: String) -> Bool
}
