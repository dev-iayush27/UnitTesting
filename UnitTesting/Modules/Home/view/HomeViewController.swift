//
//  HomeViewController.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 21/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    var arrPost: [Post]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callAPI()
    }
    
    func callAPI() {
        let webService = WebService(url: "https://jsonplaceholder.typicode.com/posts")
        webService.getData { (result, error) in
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                self.arrPost = result
                print("Total Post: ", self.arrPost?.count ?? 0)
            }
        }
    }
}
