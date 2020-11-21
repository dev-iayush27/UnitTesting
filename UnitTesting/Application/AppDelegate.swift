//
//  AppDelegate.swift
//  UnitTesting
//
//  Created by Ayush Gupta on 21/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let rootVC = UINavigationController(rootViewController: vc)
        rootVC.isNavigationBarHidden = true
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
