//
//  main.swift
//  02-字符串、数组、字典
//
//  Created by lujing on 16/5/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//1 字符串
//1.1 字符串字面量
let someString = "some String"

//1.2 空字符串
let emptyStr = ""//字面量
let emptyStr1 = String()//初始化

//1.3 可变性：是var还是let，区别于OC中的NSString和NSMutableString
var variableString = "Horse"
variableString += " and carriage"
print(variableString)

let constantString = "Highlander"

//1.4 判断相等: == !=
if variableString == constantString {
    print("两个字符串相等")
}

//1.5 拼接字符串: + +=
let string1 = "hello"
let string2 = " world"
var welcome = string1 + string2
welcome += "!"
print(welcome)

//1.6 字符串插值：\()
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//1.7 截取
let longStr = welcome+"1234567890"+"\(multiplier)"
print(longStr)
let index1 = longStr.startIndex.advancedBy(3)
let index2 = longStr.endIndex.advancedBy(-3)
let subStr1 = longStr.substringFromIndex(index1)
let subStr2 = longStr.substringToIndex(index2)
print("subStr1:\(subStr1)")
print("subStr2:\(subStr2)")
let range = Range(start: index1, end: index2)
let subStr3 = longStr.substringWithRange(range)
print("subStr3:\(subStr3)")

//1.8 前缀后缀
let fileName = "swift语法之基本数据类型.key"
if fileName.hasPrefix("swift") {//后缀
    print("前缀为swift")
}
if fileName.hasSuffix(".key") {
    print("后缀为.key")
}
//1.9 遍历字符串
for char in fileName.characters {
    print(char)
}
//1.10 单个字符的表示
let a:Character = "a"


//2 数组
//数组的表示：Array<Element>或者简洁表示为[Element],Element为元素的数据类型
//区分于OC的NSArray，Array可以存储任何类型
//2.1 空数组
var someInts = Array<Int>()
var someInts1 = [Int]()

//2.2 带默认值的数组
var someDoubles = [Double](count: 3, repeatedValue: 0.0)
print(someDoubles)
//2.3 数组相加得到新数组
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)
//2.4 字面量构造
var names = ["zhangsan","lisi","wangwu","zhaoliu","tianqi"]

//2.5 数组元素数量： count属性和isEmpty属性(Bool类型)
print("The names contains \(names.count) items")

//2.6 添加：append方法/+=
names.append("xiaocao")
names += ["lilei","hanmeimei"]

//2.7 下标操作：支持多下标
let firstPerson = names[0]//读
names[0] = "asan"//写
names[2...4] = ["zhaosi","songxiaobao"]//下标多元素少，则替换并删除
names[2...3] = ["xxx","yyy","zzz"]//下标少元素多，则替换并插入

//2.8 插入和删除
names.insert("rose", atIndex: 0)
let deletedName = names.removeAtIndex(2)//返回值是被删除的数据项
let lastName = names.removeLast()//删除最后一个
names.removeAll()//删除
//2.9 遍历
//只遍历元素值
for name in names {
    print(name)
}
//同时需要索引值和元素值，可使用enumerate()方法，返回索引和值的元组
for (index,value) in names.enumerate(){
    print("Item \(index+1):\(value)")
}

//2.10 字符串和数组互相转化
let str = "小红,小明,小丽,小刚"
let nameArr = str.componentsSeparatedByString(",")
print(nameArr)
let newStr = nameArr.joinWithSeparator("🌹")
print(newStr)

//3 字典
//字典的表示：Dictionary<Key,Value> 或者简洁形式 [Key:Value]
//3.1 构造器创建
var namesOfIntegers = [Int:String]()
//3.2 字面量创建
var student = ["name":"张三","age":"20","school":"河南青云"]

//3.3 count属性和isEmpty属性
print("The dictionary of student contains \(student.count) items.")

//3.4 下标语法
student["sex"] = "♂"
print(student["sex"])
//3.5 修改：updateValue(_:forKey:)设置新值或者更新旧值，返回值为可选类型，如果键存在，则返回旧值，否则返回nil
student.updateValue("21", forKey: "age")
student.updateValue("开封", forKey: "hometown")

//3.6 删除
//通过给值赋值为nil，可以删除键值对
student["sex"] = nil
print(student)
//removeValueForKey(_:)删除键值对，返回为可选类型：键值对存在则返回其值，不存在则返回nil
if let age = student.removeValueForKey("age") {
    print("年龄被删除：\(age)")
} else {
    print("字典中没有年龄信息")
}

//3.7 遍历
//每一个字典中的数据项都以(key, value)元组形式返回
for (key,value) in student {
    print("\(key): \(value)")
}

//单独遍历keys或者values
for key in student.keys {//.sort()可以实现有序遍历
    print("\(key)")
}
for value in student.values {
    print("\(value)")
}

//可以使用keys或者values构造数组
let keys = [String](student.keys)
print(keys)
let values = [String](student.values)
print(values)
