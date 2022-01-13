//
//  UIView+Extention.swift
//  News
//
//  Created by xx on 2022/1/11.
//

import UIKit

protocol TTRegisterCellForMine {}

extension TTRegisterCellForMine {
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
