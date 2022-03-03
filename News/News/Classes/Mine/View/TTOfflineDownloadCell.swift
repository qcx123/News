//
//  TTOfflineDownloadCell.swift
//  News
//
//  Created by xx on 2022/2/25.
//

import UIKit

class TTOfflineDownloadCell: UITableViewCell, TTRegisterCellForMine {

    @IBOutlet weak var titleLabel: UILabel!
    
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
