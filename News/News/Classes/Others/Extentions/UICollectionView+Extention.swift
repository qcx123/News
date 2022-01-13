//
//  UICollectionView+Extention.swift
//  News
//
//  Created by xx on 2022/1/12.
//

import UIKit

extension UICollectionView {
    // 注册cell
    func my_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: TTRegisterCellForMine {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        }else {
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    // 获取cell
    func my_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T! where T: TTRegisterCellForMine {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
}
