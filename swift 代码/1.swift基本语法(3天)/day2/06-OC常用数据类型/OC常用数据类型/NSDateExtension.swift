//
//  NSDateExtension.swift
//  OC常用数据类型
//
//  Created by lujing on 16/5/13.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

extension NSDate{
    //扩展一个属性
    var stringValue:String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let string = formatter.stringFromDate(self)
        return string
    }
    //扩展一个实例方法
    func string()->String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let string = formatter.stringFromDate(self)
        return string
    }
    //扩展一个类方法
    static func dateFromString(string:String)->NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.dateFromString(string)
        return date!
    }
}