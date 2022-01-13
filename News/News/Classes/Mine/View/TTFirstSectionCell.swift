//
//  TTFirstSectionCell.swift
//  News
//
//  Created by xx on 2022/1/11.
//

import UIKit

class TTFirstSectionCell: UITableViewCell, TTRegisterCellForMine {

    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightImgView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
