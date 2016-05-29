//
//  QYCity.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYCity: NSObject {
    let name: String
    unowned let country: QYCountry
    init(name: String, country: QYCountry) {
        self.name = name
        self.country = country
    }
    deinit {
        print("city \(name) bye ...")
    }
}
