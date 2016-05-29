//
//  Person.swift
//  属性的getter和setter
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Cocoa
//oc的语法规则：name的设置器setName:NSString name  获取器getName
class Person: NSObject {
    var name:String{
        set(newValue){
            print("name:set")
            //给另一个属性赋值
            storeName=newValue
        }
        get{
            print("name:get")
            return self.storeName
        }
    }
    var storeName:String!
    var age:Int=0{
        //属性观察者：可以根据属性值的变化做出响应，当代码尝试修改属性的值时，就会被调用  willSet 属性值设置之前被调用 didSet 设置属性值后被调用
        willSet(newAge){
            print("willSet 即将设置值\(age)")
        }
        didSet{
            print("didSet 已经设置值时\(age)")
        }
        
    }
    //注意点:
    //1.在给属性初始化设置类型并且赋值的时候，用willSet didSet
    //2.仅仅只给属性设置类型的时候，用get set
}
