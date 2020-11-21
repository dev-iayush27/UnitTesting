//
//  WebService.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 10/11/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import Foundation

final class WebService {
    
    private var urlSession: URLSession
    private var url: String
    
    init(url: String, urlSession: URLSession = .shared) {
        self.url = url
        self.urlSession = urlSession
    }
    
    func getData(onCompletion: @escaping ([Post]?, ErrorModel?) -> Void) {
        guard let url = URL(string: self.url) else {
            onCompletion(nil, ErrorModel.invalidRequestURLStringError)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        // request.httpBody = try? JSONEncoder.encode(<#T##self: JSONEncoder##JSONEncoder#>)
        let dataTask = self.urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                onCompletion(nil, ErrorModel.failedRequest(description: error.localizedDescription))
                return
            }
            if let data = data {
                do {
                    let dict = try JSONDecoder().decode([Post].self, from: data)
                    onCompletion(dict, nil)
                } catch {
                    onCompletion(nil, ErrorModel.responseParsingError)
                }
            }
        }
        dataTask.resume()
    }
}
