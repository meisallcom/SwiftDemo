//
//  SwiftClass.swift
//  SwiftCallOC
//
//  Created by lujing on 16/5/12.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

class SwiftClass:NSObject{
    var testOC = OCClass()
    
    override var description:String {
        return "aaaa\(testOC)"
    }
}