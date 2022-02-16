//
//  TTMyTheme.swift
//  News
//
//  Created by xx on 2022/2/16.
//

import Foundation
import SwiftTheme

enum TTMyTheme: Int {
    case day = 0
    case night = 1
    
    static var before = TTMyTheme.day
    static var current = TTMyTheme.night
    
    static func switchTo(theme: TTMyTheme) {
        before = current
        current = theme
        
        switch theme {
        case .day:
            ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        case .night:
            ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
        }
    }
    
    static func switchNight(isToNight: Bool) {
        switchTo(theme: isToNight ? .night : .day)
    }
    
    static func isNight() -> Bool {
        return current == .night
    }
}

struct TTMyThemeStyle {
    // 设置导航栏样式 （日间、夜间）
    static func setupNavigationBarStyle(viewController: UIViewController, isNight: Bool) {
        
        if isNight { // 设置夜间主题
            viewController.navigationController?.navigationBar.barStyle = .black
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white_night"), for: .default)
            viewController.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.grayColor113()]
        } else {    // 设置日间主题
            viewController.navigationController?.navigationBar.barStyle = .default
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white"), for: .default)
        }
        
        
    }
}
