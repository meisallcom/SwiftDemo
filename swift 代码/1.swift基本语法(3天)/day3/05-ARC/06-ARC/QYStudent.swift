//
//  QYStudent.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYStudent: NSObject {
    var age = 0
    
    lazy var closure:()->() = {
        [unowned self] in
        print(self.age)//闭包内引用了self
    }
    
    deinit{
        print("student bye ...")
    }
}
