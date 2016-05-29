//
//  Student.swift
//  面向对象
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Cocoa
//继承父类 Person
class Student: Person {
    //重写父类的方法
    override func getInfo()->String{
        
        return "学生姓名:\(self.name) 年龄:\(self.age)"
    }
    //
//    override func getAgeInfo()->String{
//        return "学生年龄"
//    }

}
