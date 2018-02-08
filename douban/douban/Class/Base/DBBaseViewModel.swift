//
//  DBBaseViewModel.swift
//  douban
//
//  Created by 薛佳妮 on 2018/1/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit

class DBBaseViewModel: NSObject {
    let title : String
    
    required init(title : String) {
        self.title = title
    }
    
    override var description: String {
        return "wang - \(self.title)"
    }
}
