//
//  SQLiteManager.swift
//  News
//
//  Created by xx on 2022/3/2.
//

import Foundation
import SQLite

struct SQLiteManager {
    
    var database: Connection!
    
    
    
    init() {
        do {
            let path = NSHomeDirectory() + "Documents/news.sqlite"
            database = try Connection(path)
        } catch {
            print(error)
        }
    }
    
}

struct NewTitleTabel {
    /// 数据库管理者
    private let sqlManager = SQLiteManager()
    
    /// 新闻标题 表
    private let news_title = Table("news_title")
    /// 表字段
    let id = Expression<Int64>("id")
    let category = Expression<String>("category")
    let tip_new = Expression<Int64>("tip_new")
    let default_add = Expression<Int64>("default_add")
    let web_url = Expression<String>("web_url")
    let concern_id = Expression<String>("concern_id")
    let icon_url = Expression<String>("icon_url")
    let flags = Expression<Int64>("flags")
    let type = Expression<Int64>("type")
    let name = Expression<String>("name")
    
    
    init() {
        do {
            try sqlManager.database.run(news_title.create(block: { t in
                t.column(id, primaryKey: true)
                t.column(category)
                t.column(tip_new)
                t.column(default_add)
                t.column(web_url)
                t.column(concern_id)
                t.column(icon_url)
                t.column(flags)
                t.column(type)
                t.column(name)
            }))
        } catch {
            print(error)
        }
    }
    
    /// 插入一组数据
    func insert(_ titles: [TTHomeNewsTitle]) {
        // 遍历
        for title in titles {
            insert(title)
        }
    }
    
    /// 插入一条数据
    func insert(_ title: TTHomeNewsTitle) {
        if !exist(title) {
            let insert = news_title.insert(category <- title.category, tip_new <- Int64(title.tip_new),concern_id <- title.concern_id,web_url <- title.web_url,icon_url <- title.icon_url,flags <- Int64(title.flags),type <- Int64(title.type),name <- title.name)
            do {
                try sqlManager.database.run(insert)
            } catch  {
                print(error)
            }
        }
    }
    
    /// 判断数据库中某一条数据是否存在
    func exist(_ title: TTHomeNewsTitle) -> Bool {
        // 取出该新闻分类标题的数据
        let title = news_title.filter(category == title.category)
        do {
            let count = try sqlManager.database.scalar(title.count)
            return count != 0
        } catch {
            print(error)
        }
        return false
    }
    
    func selectAll() -> [TTHomeNewsTitle] {
        var allTitles = [TTHomeNewsTitle]()
        do {
            // 遍历表中数据
            for title in try sqlManager.database.prepare(news_title) {
                // 取出表中数据，并初始化为一个结构体模型
                let newTitle = TTHomeNewsTitle(category: title[category], tip_new: Int(title[tip_new]), default_add: Int(title[default_add]), web_url: title[web_url], concern_id: title[concern_id], icon_url: title[icon_url], flags: Int(title[flags]), type: Int(title[type]), name: title[name])
                allTitles.append(newTitle)
            }
            return allTitles
        } catch {
            print(error)
        }
        return []
    }
    
    func update(_ newTitle: TTHomeNewsTitle) {
        do {
            // 取出数据库中数据
            let title = news_title.filter(category == newTitle.category)
            // 更新数据
            try sqlManager.database.run(title.update(name <- newTitle.name))
        } catch {
            print(error)
        }
    }
}
