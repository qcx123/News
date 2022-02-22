//
//  TTConstFunc.swift
//  News
//
//  Created by xx on 2022/2/22.
//

import UIKit

class TTConstFunc: NSObject {

    public class func isiPhoneXScreen() -> Bool {
        let isX = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
        print("是不是----> \(isX)")
        return isX
    }
    
}
