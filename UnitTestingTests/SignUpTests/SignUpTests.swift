//
//  SignUpTests.swift
//  UnitTestingTests
//
//  Created by Ayush Gupta on 21/11/20.
//

import XCTest
@testable import UnitTesting

class SignUpTests: XCTestCase {
    
    var signUpValidator: SignUpValidator!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.signUpValidator = SignUpValidator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.signUpValidator = nil
    }
    
    // check first name is valid
    func test_firstNameIsValid() {
        let isValid = self.signUpValidator.isFirstNameValid(firstName: "Ayush")
        XCTAssertTrue(isValid, "It should return True but it returned False.")
    }
    
    // check first name is invalid for long characters (max should be 14)
    func test_firstNameIsInvalid_forLongFirstName() {
        let isInValid = self.signUpValidator.isFirstNameValid(firstName: "Ayushguptaayushgupta")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check first name is invalid for empty character
    func test_firstNameIsInvalid_forEmptyFirstName() {
        let isInValid = self.signUpValidator.isFirstNameValid(firstName: "")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check last name is valid
    func test_lastNameIsValid() {
        let isValid = self.signUpValidator.isLastNameValid(lastName: "Gupta")
        XCTAssertTrue(isValid, "It should return True but it returned False.")
    }
    
    // check last name is invalid for long characters (max should be 14)
    func test_lastNameIsInvalid_forLongLastName() {
        let isInValid = self.signUpValidator.isLastNameValid(lastName: "Ayushguptaayushgupta")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check last name is invalid for empty character
    func test_lastNameIsInvalid_forEmptyLastName() {
        let isInValid = self.signUpValidator.isLastNameValid(lastName: "")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check email is valid
    func test_emailIsValid() {
        let isValidEmail = self.signUpValidator.isEmailValid(email: "dev.iayush27@gmail.com")
        XCTAssertTrue(isValidEmail, "It should return True but it returns False")
    }
    
    // check email is invalid
    func test_emailIsInvalid() {
        let isInvalidEmail = self.signUpValidator.isEmailValid(email: "dev.iayush27gmail.com")
        XCTAssertFalse(isInvalidEmail, "It should return False but it returns True")
    }
    
    // check email is invalid
    func test_emailIsInvalid_forEmptyEmail() {
        let isInvalidEmail = self.signUpValidator.isEmailValid(email: "")
        XCTAssertFalse(isInvalidEmail, "It should return False but it returns True")
    }
    
    // check password is valid
    func test_passwordIsValid() {
        let isValid = self.signUpValidator.isPasswordValid(password: "123456")
        XCTAssertTrue(isValid, "It should return True but it returned False.")
    }
    
    // check password is invalid for long characters (max should be 14)
    func test_passwordIsInvalid_forLongCharacters() {
        let isInValid = self.signUpValidator.isPasswordValid(password: "123456hysvn7gnbdj8")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check password is invalid for empty character
    func test_passwordIsInvalid_forEmptyPassword() {
        let isInValid = self.signUpValidator.isPasswordValid(password: "")
        XCTAssertFalse(isInValid, "It should return False but it returned True.")
    }
    
    // check repeat password is valid
    func test_repeatPasswordIsvalid() {
        let isValid = self.signUpValidator.isPasswordMatched(password: "123456", repeatPassword: "123456")
        XCTAssertTrue(isValid, "It should return True but it returned False.")
    }
    
    // check repeat password is invalid
    func test_repeatPasswordIsInvalid() {
        let isInvalid = self.signUpValidator.isPasswordMatched(password: "123456", repeatPassword: "12345")
        XCTAssertFalse(isInvalid, "It should return False but it returned True.")
    }
}
