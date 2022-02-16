//
//  TTFirstSectionCell.swift
//  News
//
//  Created by xx on 2022/1/11.
//

import UIKit

class TTFirstSectionCell: UITableViewCell, TTRegisterCellForMine {
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightImgView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myConcerns = [MyConcern](){
        didSet {
            collectionView.reloadData()
        }
    }
    
    var myCellModel: MyCellModel? {
        didSet {
            leftLabel.text = myCellModel?.text
            rightLabel.text = myCellModel?.grey_text
        }
    }
    
    var myConcern: MyConcern? {
        didSet {
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.my_registerCell(cell: TTMyConcernCell.self)
        
        // 设置主题
        theme_backgroundColor = "colors.cellBackgroundColor"
        leftLabel.theme_textColor = "colors.black"
        rightLabel.theme_textColor = "colors.cellRightTextColor"
        rightImgView.theme_image = "images.cellRightArrow"
//        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        topView.theme_backgroundColor = "colors.cellBackgroundColor"
        collectionView.theme_backgroundColor = "colors.cellBackgroundColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TTFirstSectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.my_dequeueReusableCell(indexPath: indexPath) as TTMyConcernCell
        cell.myConcern = myConcerns[indexPath.item]
        return cell
    }
    
    
}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        // 每个cell的大小
        itemSize = CGSize(width: 58, height: 74)
        // 横向间距
        minimumLineSpacing = 0
        // 纵向间距
        minimumInteritemSpacing = 0
        // cell上下左右的间距
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 设置水平滚动
        scrollDirection = .horizontal
    }
}

