//
//  main.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//1 强引用
var p1:QYPerson?
var p2:QYPerson?
var p3:QYPerson?

p1 = QYPerson(name:"某某")
p2 = p1
p3 = p2

p1 = nil
p2 = nil
p3 = nil
//没有强引用指向，对象则销毁

//2 循环强引用
//弱引用
//适用场景：两个属性的值都允许为nil，并会潜在的产生循环强引用
var john:QYPerson? = QYPerson(name:"john")
var unitOne:QYApartment? = QYApartment(unit: "One")

john?.apartment = unitOne
unitOne?.tenant = john

john = nil
unitOne = nil

//3 无主引用: 类似OC的__unsafe_unretained
//适用场景：一个属性的值允许为nil，而另一个属性的值不允许为nil,可能产生循环强引用
var xiaoming:QYCustomer? = QYCustomer(name: "小明")
xiaoming?.card = QYCreditCard(number: 1234_5678_9012_3456, customer: xiaoming!)
xiaoming = nil

//4 无主引用和隐式解析可选类型
//适用场景：两个属性都必须有值，并且初始化完成后永远不会为nil
var country:QYCountry? = QYCountry(name: "Canada", capitalName: "Ottawa")
country = nil

//5 定义捕获列表
//适用场景：闭包引起的循环强引用

var stu:QYStudent? = QYStudent()
stu!.closure()

stu = nil