//
//  QYCustomer.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYCustomer: NSObject {
    let name: String
    var card: QYCreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) bye...") }
}
