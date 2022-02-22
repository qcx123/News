//
//  AppDelegate.swift
//  News
//
//  Created by xx on 2021/11/18.
//

import UIKit
import SwiftTheme

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置主题颜色
        ThemeManager.setTheme(plistName: UserDefaults.standard.bool(forKey: isNight) ? "night_theme" : "default_theme", path: .mainBundle)
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarController = TTTabBarController()
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

