//
//  AppDelegate.swift
//  News
//
//  Created by xx on 2021/11/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarController = TTTabBarController()
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

