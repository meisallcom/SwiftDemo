//
//  QYPerson.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYPerson: NSObject {
    var name:String
    
    var apartment:QYApartment?
    
    init(name:String) {
        self.name = name
    }
    //析构器:实例释放前自动调用
    deinit{
        print("\(name) bye...")
    }
}
