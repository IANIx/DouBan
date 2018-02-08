//
//  DBHomeLayout.swift
//  douban
//
//  Created by 薛佳妮 on 2018/2/1.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit


class DBHomeLayout: NSObject {
    
    /******* 高度 *******/
    let imgMixHeight : CGFloat! = 90.0
    let imgWidth : CGFloat! = 70.0
    
    var height : CGFloat = 0.0
    
    var contextHeight : CGFloat = 0.0
    var imgHeight : CGFloat = 0.0
    var profileHeight : CGFloat = 0.0
    var fromHeight : CGFloat = 0.0
    
    let padding : CGFloat! = 15.0 //左右边间隙
    let paddingHeight : CGFloat = 10.0 //上下间隙
    let separationHeight : CGFloat = 10.0 //假分割线高度
    
    /******* 字体 *******/
    let titleFont : UIFont = dBlodFont(size: 20.0) //大标题
    let contentFont : UIFont = dSystemFont(size: 15.0) //内容
    let authorFont : UIFont = dSystemFont(size: 13.0) //作者
    let fromFont : UIFont = dSystemFont(size: 12) //来源
    var status : DBHomeStatus! = nil
    
    required init(status st : DBHomeStatus) {
        super.init()
        self.status = st;
        
        self.layout()
    }
    
    func layout() {
        
        self.fromLayout()
        self.contextLayout()
        self.profileLayout()
        
        self.height += self.paddingHeight * 2
        self.height += self.fromHeight
        self.height += self.contextHeight
        self.height += self.profileHeight
        self.height += self.separationHeight
        
    }
    
    
    func fromLayout() {
       
        switch status.from.fromId! {
        case DBFromType.DBFromTypeNomal:
            fromHeight = 0.0
            break
        case DBFromType.DBFromTypeHot:
            fromHeight = 25.0
            break
        case DBFromType.DBFromTypeColum:
            fromHeight = 25.0
            break
        }
    }
    
    func contextLayout() {
        
        if (status.img != nil) {
            imgHeight  = (imgWidth * status.img!.height!)/status.img!.width!
            
            if imgHeight < imgMixHeight {
                contextHeight = imgMixHeight
            } else {
                contextHeight = imgHeight
            }
        } else {
            let titleHeight = textSize(text: status.title,
                                       font: titleFont,
                                      width: UIScreen.main.bounds.size.width - (padding * 2)).height
            contextHeight = titleHeight + 47.0 //两行高度

        }
    }
    
    func profileLayout() {
        profileHeight = 30.0
    }
    
    func textSize(text : String , font : UIFont , width : CGFloat) -> CGSize {
        
        let maxSize : CGSize = CGSize(width:width,height:1000)
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font : font], context: nil).size
    }

}
