//
//  TTMyConcernCell.swift
//  News
//
//  Created by xx on 2022/1/14.
//

import UIKit
import Kingfisher

class TTMyConcernCell: UICollectionViewCell, TTRegisterCellForMine {

    @IBOutlet weak var avatarImgView: UIImageView!
    
    @IBOutlet weak var vipImgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    /// 消息通知
    @IBOutlet weak var tipsButton: UIButton!
    var myConcern: MyConcern?{
        didSet {
            avatarImgView.kf.setImage(with: URL(string: myConcern?.icon ?? ""))
            nameLabel.text = myConcern?.name
            if let is_verift = myConcern?.is_verift {
                vipImgView.isHidden = !is_verift
            }
            if let tips = myConcern?.tips {
                tipsButton.isHidden = !tips
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tipsButton.layer.borderWidth = 1
        tipsButton.layer.borderColor = UIColor.white.cgColor
    }

}
