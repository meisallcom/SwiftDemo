//
//  QYApartment.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYApartment: NSObject {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: QYPerson?//弱引用
    //var tenant:QYPerson?
    deinit {
        print("Apartment \(unit) bye...")
    }
}
