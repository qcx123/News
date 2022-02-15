//
//  TTTabBar.swift
//  News
//
//  Created by xx on 2021/11/18.
//

import UIKit

class TTTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    // private 绝对私有，除了在当前类中可以访问之外，其他任何类或者该类的扩展都不能访问到
    // fileprivate 文件私有，可以在当前类文件中访问，其他文件不能访问
    // open 在任何类文件中都能访问
    // internal 默认的，可以不写
    private lazy var publishButton: UIButton = {
        let publishButton = UIButton(type: .custom)
//        publishButton.sizeToFit()
        publishButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
        publishButton.layer.masksToBounds = true
        publishButton.layer.cornerRadius = 25
        publishButton.backgroundColor = UIColor.cyan
        publishButton.setImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publishButton.setImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected)
        return publishButton
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 当前tabbar的宽度和高度
        let width = frame.width
        let height = frame.height
        
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.1)
        
        // 设置其他按钮的frame
        let buttonW = width * 0.2
        let buttonH = height
        let buttonY: CGFloat = 0.0
        
        var index = 0
        for button in subviews {
//            print(button)
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) {continue}
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
        }
        
    }
    

}
