//
//  WebServiceTests.swift
//  UnitTestingTests
//
//  Created by Ayush Gupta on 20/11/20.
//

import XCTest
@testable import UnitTesting

class WebServiceTests: XCTestCase {
    
    var webService: WebService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        self.webService = WebService(url: "https://jsonplaceholder.typicode.com/posts", urlSession: urlSession)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.webService = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    // Integration testing for API...
    func test_responseShouldNotBeNil_errorShouldBeNil() {
        self.webService = WebService(url: "https://jsonplaceholder.typicode.com/posts")
        let expectation = self.expectation(description: "Response Expectation.")
        self.webService.getData { (result, error) in
            XCTAssertNotNil(result, "It should not be nil.")
            XCTAssertNil(error, "It should be nil.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    
    // Successful mock response unit testing...
    func test_mockWebService_success() {
        let jsonString = "[{\"userId\": 1,\"id\": 1,\"title\": \"optio reprehenderit\",\"body\": \"eveniet architecto\"},{\"userId\": 1,\"id\": 2,\"title\": \"qui est esse\",\"body\": \"est rerum tempore\"}]"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Success response expectation.")
        self.webService.getData { (result, error) in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 2)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    // empty request url error...
    func test_mockWebService_requestURLError() {
        self.webService = WebService(url: "")
        let expectation = self.expectation(description: "An empty URL string expectation.")
        webService.getData { (result, error) in
            XCTAssertEqual(error, ErrorModel.invalidRequestURLStringError)
            XCTAssertNil(result, "Result should be nil.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    // Request failed due to some server side error...
    func test_mockWebService_failedRequestError() {
        let expectation = self.expectation(description: "Failed request expectation.")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = ErrorModel.failedRequest(description: errorDescription)
        self.webService.getData { (result, error) in
            //            XCTAssertEqual(error, ErrorModel.failedRequest(description: errorDescription), "Should not return exception.")
            XCTAssertNil(result, "Result should be nil.")
            //            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    // Mock response json parsing error... (Any response parameter should be different form Post model parameter)
    func test_mockWebService_responseModelParsingError() {
        let jsonString = "[{\"userId\": 1,\"id\": 1,\"titl\": \"optio reprehenderit\",\"body\": \"eveniet architecto\"},{\"userId\": 1,\"id\": 2,\"title\": \"qui est esse\",\"body\": \"est rerum tempore\"}]"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Failed request expectation.")
        
        self.webService.getData { (result, error) in
            XCTAssertEqual(error, ErrorModel.responseParsingError, "Should not return exception.")
            XCTAssertNil(result, "Result should be nil.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
}
