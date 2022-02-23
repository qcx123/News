//
//  TTSettingModel.swift
//  News
//
//  Created by xx on 2022/2/23.
//

import Foundation
import HandyJSON

struct TTSettingModel: HandyJSON {
    var title: String = ""
    var subtitle: String = ""
    var rightTitle: String = ""
    var isHiddenSubtitle: Bool = false
    var isHiddenRightTitle: Bool = false
    var isHiddenSwitch: Bool = false
    var isHiddenRightArrow: Bool = false
    
}
