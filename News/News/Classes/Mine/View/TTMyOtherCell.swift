//
//  TTMyOtherCell.swift
//  News
//
//  Created by xx on 2021/12/2.
//

import UIKit

class TTMyOtherCell: UITableViewCell, TTRegisterCellForMine {

    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
