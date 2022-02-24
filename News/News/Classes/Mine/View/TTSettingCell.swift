//
//  TTSettingCell.swift
//  News
//
//  Created by xx on 2022/2/23.
//

import UIKit

class TTSettingCell: UITableViewCell, TTRegisterCellForMine {

    @IBOutlet weak var subtitleLabelHeight: NSLayoutConstraint!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 副标题
    @IBOutlet weak var subtitleLabel: UILabel!
    /// 右边标题
    @IBOutlet weak var rightTitleLabel: UILabel!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!
    
    @IBOutlet weak var bottomLine: UIView!
    
    var setting: TTSettingModel? {
        didSet {
            titleLabel.text = setting?.title
            subtitleLabel.text = setting?.subtitle
            rightTitleLabel.text = setting?.rightTitle
            arrowImageView.isHidden = !setting!.isHiddenRightTitle
            switchView.isHidden = setting!.isHiddenSwitch
            rightTitleLabel.isHidden = setting!.isHiddenRightTitle
            subtitleLabelHeight.constant = setting!.isHiddenSubtitle ? 0 : 20
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        theme_backgroundColor = "colors.cellBackgroundColor"
        bottomLine.theme_backgroundColor = "colors.separatorViewColor"
        titleLabel.theme_textColor = "colors.black"
        rightTitleLabel.theme_textColor = "colors.cellRightTextColor"
        arrowImageView.theme_image = "images.cellRightArrow"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


