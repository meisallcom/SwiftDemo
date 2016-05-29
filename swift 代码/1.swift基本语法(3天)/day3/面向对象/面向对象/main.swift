//
//  main.swift
//  面向对象
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation
//swift 不用手动调用文件 import 文件名.swift
// import 框架名 在调用框架的时候使用
//print("Hello, World!")

//根据Person类 生成对象
let person=Person()
//person.age=18
//person.name="张三"
print("姓名 \(person.name) 年龄 \(person.age)")
NSLog("姓名 %@ 年龄 %d", person.name,person.age)
//oc调用 对象的方法 [对象名 方法名]
//swift调用对象的方法 对象名.方法名
let name=person.getName()
print("getName的返回值 \(name)")


//生成student对象
let student=Student()
//student对象调用父类 Person中的属性name 和age
student.name="李四"
student.age=15
//调用student对象的父类Perons中的方法
let name1=student.getName()
print("student name=\(name1)")
//调用student对象的重写方法
let strInfo=student.getInfo()
print("信息:\(strInfo)")

//调用Person的类方法
//用类方法生成一个person对象
let person1=Person.person()
person1.name="王五"
print("类方法生成对象 name\(person1.name)")
