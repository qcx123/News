//
//  TTMoreLoginViewController.swift
//  News
//
//  Created by xx on 2022/2/21.
//

import UIKit
import IBAnimatable

class TTMoreLoginViewController: AnimatableModalViewController {

    @IBOutlet weak var loginCloseButton: UIButton!
    /// 顶部标题
    @IBOutlet weak var topLabel: UILabel!
    /// 手机号 view
    @IBOutlet weak var mobileView: AnimatableView!
    /// 验证码 view
    @IBOutlet weak var passwrodView: AnimatableView!
    /// 发送验证码 view
    @IBOutlet weak var sendVerifyView: UIView!
    /// 找回密码 view
    @IBOutlet weak var findPasswordView: UIView!
    /// 发送验证码按钮
    @IBOutlet weak var sendVerifyButton: UIButton!
    /// 手机号 输入框
    @IBOutlet weak var mobileTextField: UITextField!
    /// 找回密码 按钮
    @IBOutlet weak var findPasswordButton: UIButton!
    /// 密码输入框
    @IBOutlet weak var passwordtextField: UITextField!
    /// 未注册
    @IBOutlet weak var middleTipLabel: UILabel!
    /// 进入头条
    @IBOutlet weak var enterTouTiaoButton: AnimatableButton!
    /// 阅读条款
    @IBOutlet weak var readLabel: UILabel!
    /// 阅读按钮
    @IBOutlet weak var readButton: UIButton!
    /// 帐号密码登录
    @IBOutlet weak var loginModeButton: UIButton!
    
    @IBOutlet weak var wechatLoginButton: UIButton!
    
    @IBOutlet weak var qqLoginButton: UIButton!
    
    @IBOutlet weak var tianyiLoginButton: UIButton!
    
    @IBOutlet weak var mailLoginButton: UIButton!
    
    
    @IBAction func loginModeButtonClicked(_ sender: UIButton) {
        loginModeButton.isSelected = !sender.isSelected
        sendVerifyView.isHidden = sender.isSelected
        findPasswordView.isHidden = !sender.isSelected
        middleTipLabel.isHidden = sender.isSelected
        passwordtextField.placeholder = sender.isSelected ? "密码" : "请输入验证码"
        topLabel.text = sender.isSelected ? "账号密码登录" : "登录你的头条，精彩永不流失"
    }
    
    @IBAction func readButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginModeButton.setTitle("免密码登录", for: .selected)
        findPasswordView.isHidden = true
        self.view.theme_backgroundColor = "colors.cellBackgroundColor"
        topLabel.theme_textColor = "colors.black"
        middleTipLabel.theme_textColor = "colors.cellRightTextColor"
        readLabel.theme_textColor = "colors.black"
        enterTouTiaoButton.theme_backgroundColor = "colors.enterToutiaoBackgroundColor"
        enterTouTiaoButton.theme_setTitleColor("colors.enterToutiaoTextColor", forState: .normal)
        readButton.theme_setImage("images.loginReadButtonSelected", forState: .normal)
        readButton.theme_setImage("images.loginReadButton", forState: .selected)
        mobileView.theme_backgroundColor = "colors.loginMobileViewBackgroundColor"
        passwrodView.theme_backgroundColor = "colors.loginMobileViewBackgroundColor"
        loginCloseButton.theme_setImage("images.loginCloseButtonImage", forState: .normal)
        wechatLoginButton.theme_setImage("images.moreLoginWechatButton", forState: .normal)
        qqLoginButton.theme_setImage("images.moreLoginQQButton", forState: .normal)
        tianyiLoginButton.theme_setImage("images.moreLoginTianyiButton", forState: .normal)
        mailLoginButton.theme_setImage("images.moreLoginMailButton", forState: .normal)
    }
    
    @IBAction func closeBtnClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
