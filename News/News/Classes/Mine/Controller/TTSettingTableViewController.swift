//
//  TTSetTableViewController.swift
//  News
//
//  Created by xx on 2022/2/22.
//

import UIKit

class TTSettingTableViewController: UITableViewController {

    // 存储plist文件数据
    var sections = [[TTSettingModel]]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        SettingTools.calculetDiskCacheSize { size in
            self.reloadRow(row: 0, section: 0)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = sections[section].count
        return rows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.my_dequeueReusableCell(indexPath: indexPath) as TTSettingCell
        let rows = sections[indexPath.section]
        cell.setting = rows[indexPath.row]
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.rightTitleLabel.text = SettingTools.size
            case 1:
                cell.rightTitleLabel.text = SettingTools.fontSize
            case 2:
                cell.selectionStyle = .none
            case 3:
                cell.rightTitleLabel.text = SettingTools.network
            case 4:
                cell.rightTitleLabel.text = SettingTools.attention
            default: break
                
            }
        case 1: break
        default: break
            
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        header.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                loadCacheAlert()
            case 1:
                setFontAlert()
            case 3:
                setNetworkAlert()
            case 4:
                setAttentionAlert()
            default: break
                
            }
        case 1: break
        default: break
            
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TTSettingTableViewController {
    /// 清除缓存
    fileprivate func loadCacheAlert() {
        let alertVC = UIAlertController(title: "确定清除所有缓存？", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            
        }
        let okAction = UIAlertAction(title: "确定", style: .default) { _ in
            SettingTools.cleanCache()
            self.reloadRow(row: 0, section: 0)
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    /// 设置字体大小
    fileprivate func setFontAlert() {
        let alertVC = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            
        }
        let smallAction = UIAlertAction(title: "小", style: .default) { _ in
            SettingTools.fontSize = "小"
            self.reloadRow(row: 1, section: 0)
        }
        let middleAction = UIAlertAction(title: "中", style: .default) { _ in
            SettingTools.fontSize = "中"
            self.reloadRow(row: 1, section: 0)
        }
        let bigAction = UIAlertAction(title: "大", style: .default) { _ in
            SettingTools.fontSize = "大"
            self.reloadRow(row: 1, section: 0)
        }
        let largeAction = UIAlertAction(title: "特大", style: .default) { _ in
            SettingTools.fontSize = "特大"
            self.reloadRow(row: 1, section: 0)
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(smallAction)
        alertVC.addAction(middleAction)
        alertVC.addAction(bigAction)
        alertVC.addAction(largeAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    /// 非wifi网络流量
    fileprivate func setNetworkAlert() {
        let alertVC = UIAlertController(title: "设置网络", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            
        }
        let bestAction = UIAlertAction(title: "最佳效果(下载大图)", style: .default) { _ in
            SettingTools.network = "最佳效果(下载大图)"
            self.reloadRow(row: 3, section: 0)
        }
        let betterAction = UIAlertAction(title: "较省效果(下载图)", style: .default) { _ in
            SettingTools.network = "较省效果(下载图)"
            self.reloadRow(row: 3, section: 0)
        }
        let leastAction = UIAlertAction(title: "最省效果(下载图)", style: .default) { _ in
            SettingTools.network = "最省效果(下载图)"
            self.reloadRow(row: 3, section: 0)
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(bestAction)
        alertVC.addAction(betterAction)
        alertVC.addAction(leastAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    /// 非wifi播放视频提醒
    fileprivate func setAttentionAlert() {
        let alertVC = UIAlertController(title: "非wifi播放视频提醒", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            
        }
        let alwaysAction = UIAlertAction(title: "每次提醒", style: .default) { _ in
            SettingTools.attention = "每次提醒"
            self.reloadRow(row: 4, section: 0)
        }
        let onlyAction = UIAlertAction(title: "提醒一次", style: .default) { _ in
            SettingTools.attention = "提醒一次"
            self.reloadRow(row: 4, section: 0)
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(alwaysAction)
        alertVC.addAction(onlyAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    fileprivate func reloadRow(row:Int, section:Int) {
        let indexPath = IndexPath(row: row, section: section)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension TTSettingTableViewController {
    func setupUI() {
        let plistPath = Bundle.main.path(forResource: "settingPlist", ofType: "plist")
        let cellPlist = NSArray(contentsOfFile: plistPath!) as! [Any]
        for dicts in cellPlist {
            let array = dicts as! [[String : Any]]
            var rows = [TTSettingModel]()
            for dict in array {
                let setting = TTSettingModel.deserialize(from: dict)
                rows.append(setting!)
            }
            sections.append(rows)
        }
        
        sections = cellPlist.compactMap { section in
            (section as! [Any]).compactMap { row in
                TTSettingModel.deserialize(from: row as? Dictionary)
            }
        }
        
        tableView.my_registerCell(cell: TTSettingCell.self)
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.theme_backgroundColor = "colors.cellBackgroundColor"
    }
}


