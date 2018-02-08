
//
//  DBHomeStatus.swift
//  douban
//
//  Created by 薛佳妮 on 2018/2/1.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit
import ObjectMapper

class DBUser: Mappable {
    var userName : String?
    var userAvatar : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userName <- map["userName"]
        userAvatar <- map["userAvatar"]
    }
    
}
class DBImg: Mappable {
    var imgUrl : String?
    var width : CGFloat?
    var height : CGFloat?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imgUrl <- map["imgUrl"]
        width <- map["width"]
        height <- map["height"]
    }
}

enum DBFromType : NSInteger {
    case DBFromTypeNomal = 0
    case DBFromTypeHot = 1
    case DBFromTypeColum = 2
}
class DBFrom: Mappable {
    
    var fromId : DBFromType?
    var column : String? //栏目名称
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        fromId <- map["fromId"]
        column <- map["column"]
    }
}

class DBHomeStatus: Mappable {
    var img : DBImg? //图片URL
    var from : DBFrom! //来源
    var user : DBUser! //作者信息
    var title : String! //文章标题
    var context : String! //文章内容
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        img <- map["img"]
        from <- map["from"]
        title <- map["title"]
        context <- map["context"]
    }

}
