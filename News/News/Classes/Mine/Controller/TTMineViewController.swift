//
//  TTMineViewController.swift
//  News
//
//  Created by xx on 2021/11/18.
//

import UIKit

class TTMineViewController: TTBaseViewController {

    lazy var tabelView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    fileprivate lazy var headerView: TTNoLoginHeaderView = {
        let headerView = Bundle.main.loadNibNamed("\(TTNoLoginHeaderView.self)", owner: nil, options: nil)?.last as! TTNoLoginHeaderView
        return headerView
    }()
    
    var sections = [[MyCellModel]]()
    var concerns = [MyConcern]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabelView)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.backgroundColor = UIColor.globalBackgroundColor()
        tabelView.my_registerCell(cell: TTMyOtherCell.self)
        tabelView.my_registerCell(cell: TTFirstSectionCell.self)
        
        TTNetworkTool.loadMyCellData { sections in
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myConcerns = [MyCellModel]()
            myConcerns.append(myConcern!)
            self.sections.append(myConcerns)
            self.sections += sections
            self.tabelView.reloadData()
            TTNetworkTool.loadMyContern { concerns in
                self.concerns = concerns
                let indexSet = IndexSet(integer: 0)
                self.tabelView.reloadSections(indexSet, with: .automatic)
            }
        }
    }
    
    
}

extension TTMineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return headerView.frame.height
        }
        return section == 1 ? 1 : 10
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        }
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        headView.backgroundColor = UIColor(r: 247, g: 248, b: 249)
        return headView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.my_dequeueReusableCell(indexPath: indexPath) as TTFirstSectionCell
            let section = sections[indexPath.section]
            let myCellModel = section[indexPath.row]
            cell.myCellModel = myCellModel;
            if concerns.count == 0 || concerns.count == 1 {
                cell.collectionView.isHidden = true
            }
            if concerns.count == 1 {
                cell.myConcern = concerns.first
            }
            if concerns.count > 1 {
                cell.myConcerns = concerns
            }
            return cell
        }
        let cell = tableView.my_dequeueReusableCell(indexPath: indexPath) as TTMyOtherCell
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (concerns.count == 0 || concerns.count == 1) ? 40 : 114
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabelView.deselectRow(at: indexPath, animated: true)// 去掉点击阴影
    }
    
}
