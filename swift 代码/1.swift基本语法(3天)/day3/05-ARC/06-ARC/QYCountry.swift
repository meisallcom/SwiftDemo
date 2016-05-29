//
//  QYCountry.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYCountry: NSObject {
    let name: String
    var capitalCity: QYCity!
    init(name: String, capitalName: String) {
        self.name = name
        super.init()
        capitalCity = QYCity(name: capitalName, country: self)
    }
    deinit {
        print("country \(name) bye ...")
    }

}
