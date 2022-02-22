//
//  TTNoLoginHeaderView.swift
//  News
//
//  Created by xx on 2022/1/20.
//

import UIKit
import IBAnimatable

class TTNoLoginHeaderView: UIView {

    //点击更多登录按钮
    var moreLoginButtonClicked: (()->())?
    
    // 手机按钮
    @IBOutlet weak var mobileButton: UIButton!
    // 微信按钮
    @IBOutlet weak var wechatButton: UIButton!
    // QQ 按钮
    @IBOutlet weak var qqButton: UIButton!
    // 新浪按钮
    @IBOutlet weak var sinaButton: UIButton!
    // 更多登录方式按钮
    @IBOutlet weak var moreLoginButton: AnimatableButton!
    // 收藏按钮
    @IBOutlet weak var favoriteButton: UIButton!
    // 历史按钮
    @IBOutlet weak var historyButton: UIButton!
    // 日间/夜间 按钮
    @IBOutlet weak var dayOrNightButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayOrNightButton.isSelected = UserDefaults.standard.bool(forKey: isNight)
        //视差效果
        let effectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectX.maximumRelativeValue = 20
        effectX.minimumRelativeValue = -20
        stackView.addMotionEffect(effectX)
        
        
        // 设置主题
        mobileButton.theme_setImage("images.loginMobileButton", forState: .normal)
        wechatButton.theme_setImage("images.loginWechatButton", forState: .normal)
        qqButton.theme_setImage("images.loginQQButton", forState: .normal)
        sinaButton.theme_setImage("images.loginSinaButton", forState: .normal)
        favoriteButton.theme_setImage("images.mineFavoriteButton", forState: .normal)
        historyButton.theme_setImage("images.mineHistoryButton", forState: .normal)
        dayOrNightButton.theme_setImage("images.dayOrNightButton", forState: .normal)
        dayOrNightButton.setTitle("夜间", for: .normal)
        dayOrNightButton.setTitle("日间", for: .selected)
        moreLoginButton.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreLoginButton.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        favoriteButton.theme_setTitleColor("colors.black", forState: .normal)
        historyButton.theme_setTitleColor("colors.black", forState: .normal)
        dayOrNightButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
        
        
    }
    
    @IBAction func dayOrNightButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        UserDefaults.standard.set(sender.isSelected, forKey: isNight)
        TTMyTheme.switchNight(isToNight: sender.isSelected)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: sender.isSelected)
    }
    
    @IBAction func moreLoginButtonClicked(_ sender: AnimatableButton) {
        moreLoginButtonClicked?()
    }
}
