//
//  TTNetworkTool.swift
//  News
//
//  Created by xx on 2021/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol TTNetworkToolProtocol {
    // --------------------------- 首页 ------------------------
    // 首页顶部新闻辩题数据
    static func loadHomeNewsTitleData(complete: @escaping (_ sections: [TTHomeNewsTitle])->())
    
    // --------------------------- 我的 mine ------------------------
    // 我的界面 cell 的数据
    static func loadMyCellData(complete: @escaping (_ sections: [[MyCellModel]])->())
    // 我的关注数据
    static func loadMyContern(complete: @escaping (_ concerns: [MyConcern])->())
}

extension TTNetworkToolProtocol {
    // --------------------------- 首页 ------------------------
    // 首页顶部新闻辩题数据
    static func loadHomeNewsTitleData(complete: @escaping (_ newsTitles: [TTHomeNewsTitle])->()) {
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id, "iid": iid]
        
        AF.request(url, parameters: params).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                
                if let dataDict = json["data"].dictionary {
                    print(dataDict)
                    if let data = dataDict["data"]?.arrayObject {
                        var titles = [TTHomeNewsTitle]()
                        let jsonString = "{\"category\": \"\", \"name\": \"推荐\"}"
                        let recommend = TTHomeNewsTitle.deserialize(from: jsonString)
                        titles.append(recommend!)
                        for item in data {
                            let newsTitle = TTHomeNewsTitle.deserialize(from: item as? NSDictionary)
                            titles.append(newsTitle!)
                        }
                        complete(titles)
                    }
                }
                break
            case .failure(let error):
                // 网络错误的提示信息
                print(error)
                break
            }
        }
        
    }
    
    // --------------------------- 我的 mine ------------------------
    // 我的界面 cell 的数据
    static func loadMyCellData(complete: @escaping (_ sections: [[MyCellModel]])->()) {
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id]
        
        AF.request(url, parameters: params).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                print(json)
                if let data = json["data"].dictionary {
                    print(data)
                    if let sections = data["sections"]?.array {
                        var sectionArray = [[MyCellModel]]()
                        for item in sections {
                            var rows = [MyCellModel]()
                            for row in item.arrayObject! {
                                let myCellModel = MyCellModel.deserialize(from: row as? NSDictionary)
                                rows.append(myCellModel!)
                            }
                            sectionArray.append(rows)
                        }
                        complete(sectionArray)
                    }
                }
                break
            case .failure(let error):
                // 网络错误的提示信息
                print(error)
                break
            }
        }
    }
    // 我的关注数据
    static func loadMyContern(complete: @escaping (_ concerns: [MyConcern])->()) {
        let url = BASE_URL + "/concern/v2/follow/my_follow/?"
        let params = ["device_id": device_id]
        
        AF.request(url, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                print(json)
                if let datas = json["data"].arrayObject {
                    print(datas)
                    var concerns = [MyConcern]()
                    for data in datas {
                        let myCellModel = MyConcern.deserialize(from: data as? NSDictionary)
                        concerns.append(myCellModel!)
                    }
                    complete(concerns)
                }
                break
            case .failure(let error):
                // 网络错误的提示信息
                print(error)
                break
            }
        }
    }
}

struct TTNetworkTool: TTNetworkToolProtocol {
    

}
