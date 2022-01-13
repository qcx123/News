//
//  UITableView+Extention.swift
//  News
//
//  Created by xx on 2022/1/12.
//

import UIKit

extension UITableView {
    // 注册cell
    func my_registerCell<T: UITableViewCell>(cell: T.Type) where T: TTRegisterCellForMine {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        }else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    // 获取cell
    func my_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T! where T: TTRegisterCellForMine {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
