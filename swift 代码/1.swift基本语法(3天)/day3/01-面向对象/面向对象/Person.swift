//
//  Person.swift
//  面向对象
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation
/*
  面向对象的概念:把事物映射到程序代码中，设计成一个类，根据这个类生成一个对象，把对象当做程序最基本的单元，调用对象中的属性和方法。
 面向对象的基本特征：
 1.封装：根据事物的属性和行为 把它抽象出来，封装成一个类.
 2.继承:子类调用父类的方法
 3.多态：父类定义了方法，通过子类重写(重载)方法以实现不同的功能
 */
class Person: NSObject {
    //1.属性
    //OC:property(nonmatic strong) NSString *name
    var name:String!//姓名
    var age:Int!
    //2.方法
    //func 方法名(参数1：参数类型，参数2...)->返回值类型{}
    func getName()->String{
        return name
    }
    func getAge()->Int{
        return age
    }
    func getInfo()->String{
        return name+String(age)
    }
    func getNameInfo()->String{
        return name
    }
    //oc 类中的 初始化方法(构造函数) init
    //swift的初始化方法(构造函数)
    //3.重写：重写父类NSObject的方法init
    override init() {
        //oc的写法[super init]
        super.init()
        print("Person 类中的初始化函数Init")
        name="未知"
        age=0
    }
    //定义方法 开头以final 表示 子类禁止重写父类的方法
    final func getAgeInfo()->String{
        return "年龄 \(self.age)"
    }
    //OC的写法initWithName:(NSString *) strName Age:(NSString) age
    //4.swift 自定义初始化方法(构造函数)
    init(name:String,age:Int){
        
        self.name=name
        self.age=age
    }
    //5.析构函数：对象销毁 要调用的方法
    //dealloc
    deinit{
        print("deinit")
    }
    
    //OC调用 类方法 [类名 函数名]
    //6.swift 类方法实现
    class func person()->Person{
        return Person() //创建一个person对象
    }
    
    
}
