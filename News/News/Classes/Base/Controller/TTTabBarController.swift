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
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        addChildViewControllers()
    }
    
    // 添加子控制器
    func addChildViewControllers() {
        addChild(TTHomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        addChild(TTVideoViewController(), title: "视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        addChild(TTHuoshanViewController(), title: "小视频", imageName: "video_tabbar_32x32_", selectImageName: "video_tabbar_press_32x32_")
        addChild(TTMineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
        
        // tabbar 是 readonly属性，不能直接修改，利用KVC来修改
        setValue(TTTabBar(), forKey: "tabBar")
    }
    
    // 初始化子控制器
    func addChild(_ childController: UIViewController, title: String, imageName: String, selectImageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childController.title = title
        let navVC = TTNavigationController(rootViewController: childController)
        addChild(navVC)
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
