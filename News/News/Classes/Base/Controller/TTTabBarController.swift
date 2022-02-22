//
//  TTTabBarController.swift
//  News
//
//  Created by xx on 2021/11/18.
//

import UIKit

class TTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let tabbar = UITabBar.appearance()
//        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        addChildViewControllers()
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
    }
    
    // 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        let selected = notification.object as! Bool
        if selected { // 设置为夜间
            for childNavController in self.children {
                switch childNavController.title! {
                case "首页":
                    setNightChildController(controller: childNavController, imageName: "home")
                case "视频":
                    setNightChildController(controller: childNavController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childNavController, imageName: "huoshan")
                case "未登录":
                    setNightChildController(controller: childNavController, imageName: "no_login")
                default:
                    break
                }
            }
        } else { // 设置为日间
            for childNavController in self.children {
                switch childNavController.title! {
                case "首页":
                    setDayChildController(controller: childNavController, imageName: "home")
                case "视频":
                    setDayChildController(controller: childNavController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childNavController, imageName: "huoshan")
                case "未登录":
                    setDayChildController(controller: childNavController, imageName: "no_login")
                default:
                    break
                }
            }
        }
    }
    
    // 设置夜间控制器
    func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    // 设置日间控制器
    func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    // 添加子控制器
    func addChildViewControllers() {
        setChildViewController(TTHomeViewController(), title: "首页", imageName: "home")
        setChildViewController(TTVideoViewController(), title: "西瓜视频", imageName: "video")
//        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(TTHuoshanViewController(), title: "微头条", imageName: "huoshan")
        setChildViewController(TTMineViewController(), title: "未登录", imageName: "no_login")
        
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(TTTabBar(), forKey: "tabBar")
    }
    
    
    // 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        let navVC = TTNavigationController(rootViewController: childController)
        addChild(navVC)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
