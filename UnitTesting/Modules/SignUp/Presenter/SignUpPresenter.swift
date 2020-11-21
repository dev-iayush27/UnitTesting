//
//  SignUpPresenter.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 21/11/20.
//

import Foundation

class SignUpPresenter {
    
    private var formModelValidator: SignUpValidatorProtocol
    
    init(formModelValidator: SignUpValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        if !self.formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !self.formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !self.formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        if !self.formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !self.formModelValidator.isPasswordMatched(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
    }
}
