//
//  MockURLProtocol.swift
//  UnitTestingTests
//
//  Created by Ayush Gupta on 10/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let err = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: err)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
