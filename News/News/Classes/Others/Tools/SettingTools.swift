//
//  SettingTools.swift
//  News
//
//  Created by xx on 2022/2/23.
//

import Foundation
import Kingfisher

class SettingTools {
    
    /// 字体大小
    static var fontSize: String = "中"
    /// 网络
    static var network: String = "最佳效果(下载大图)"
    /// 非WiFi网络播放提醒
    static var attention: String = "提醒一次"
    /// 缓存大小
    static var size:String = "0.00M"
    
    /// 计算缓存大小
    class func calculetDiskCacheSize(complete: @escaping (_ size: String) -> ()){
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskStorageSize { result in
            switch result {
            case let .failure(error):
                print(error)
                complete("0.00M")
            case let .success(size):
                let sizeM = Double(size) / 1024.0 / 1024.0
                self.size = String(format: "%.2fM", sizeM)
                complete(self.size)
            }
        }
        
    }
    
    /// 清除缓存
    class func cleanCache() {
        let cache = KingfisherManager.shared.cache
        cache.clearCache()
        cache.clearDiskCache()
        cache.clearMemoryCache()
        cache.cleanExpiredCache()
        cache.cleanExpiredDiskCache()
        
        size = "0.00M";
    }
}
