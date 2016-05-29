//
//  main.swift
//  01-基本数据类型
//
//  Created by lujing on 16/5/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

//0.导入基础库框架Foundation
import Foundation

//不需要main函数，类似脚本逐行执行
print("Hello, World!")//一行一条语句不需要分号
print("hello");print("swift")//一行多条语句需要加分号
print("不换行",terminator:"")//默认print会换行的

//1.声明变量和常量：var和let
var myVar = 10//带初始化值的不需要指明类型，可以推断
let lx = 5//值不需要改变的一般用常量
var x = 1,y = 2,z = 3//一行声明多个变量，逗号隔开

//1.1 类型标注
var anotherVar:Int//类型标注
var a,b,c:Int//一行声明多个相同类型的变量，只需最后一个加类型标注

let ly:Int
ly = 3

//1.2 命名更宽泛
let π = 3.14
let 你好 = "你好"
let 🐷 = "pig"

//1.3 打印更方便
print("\(myVar)")
//OC: NSLog("%d",myVar)

//2 常用类型:类型推断或者显式指定
var n = 1//推断为整型Int
let hello = "hello"//推断为字符串型String

var myInt:Int = 10//整型
var myFloat:Float = 3.3//单精度浮点型
var myDouble:Double = 3.1415//双精度浮点型
var str:String = "swift"//字符串型
var isMan:Bool = true//布尔型true/false,对应OC的YES/NO

//2.1 Int,长度与当前平台的原生字长相同：Int == Int64
//范围
let minValue = Int.min
let maxValue = Int.max
print("\(minValue)")
print("\(maxValue)")
//不同进制的字面量
let decimalInteger = 17           // 默认十进制，无前缀
let binaryInteger = 0b10001       // 二进制的17，前缀0b
let octalInteger = 0o21           // 八进制的17，前缀0o
let hexadecimalInteger = 0x11     // 十六进制的17，前缀0x
let oneMillion = 1_000_000//可以加_增强可读性

//2.2 类型转换：类型相同才可以运算或者赋值
let three = 3
let pointOneFour = 0.14159
let pi = Double(three) + pointOneFour

str = String(200)
print(str)
//注：SomeType(ofInitialValue)其实是调用了对应类型的构造器

//2.3 类型别名
typealias Byte = Int8//区别于OC: typedef Int8 Byte

let one:Byte = 1

//3 元组：把多个值组合成一个复合值
//3.1 定义
let http404Error = (404, "Not Found")//类型为(Int,String)
//3.2 元素的拆分
let (statusCode, statusMessage) = http404Error
print("\(statusCode)")
print("\(statusMessage)")
//3.3 取出部分元素：用_忽略不需要的元素
let (justTheStatusCode, _) = http404Error
print("\(justTheStatusCode)")
//3.4 通过下标访问元素
print("状态码：\(http404Error.0)")
print("状态信息：\(http404Error.1)")
//3.5 通过元素名称访问元素
let http200Status = (statusCode:200,description:"OK")
print("状态码：\(http200Status.statusCode)")
print("状态信息：\(http200Status.description)")
//注：元组用途：（1）作为函数返回值（2）临时组织少量数据（数据量多或者非临时考虑结构体和类）

//4 可选类型：有值或者没有值，可以用于任何类型，处理值可能缺失的情况
//4.1 形式：类型名?
var numOrNil:Int? = 5//现在numOrNil有值，等于5
numOrNil = nil//现在numOrNil没有值
//4.2 没有初始化的可选常量或者变量自动赋值为nil
var girlFriend:String?//此时为nil
print("girlFriend:\(girlFriend)")

//4.3 强制解析：如果确定有值，可加!取出值
girlFriend = "hanmeimei"
let girl:String = girlFriend!
print("lilei's girlFriend is \(girlFriend!)")
//print("\(numOrNil!)")//对nil进行强制解析会崩溃

//4.4 可选绑定: 如果可选类型有值，则把值赋给一个常量或者变量
if let num = Int("123") {
    print("converted num is \(num)")
}

//4.5 隐式解析可选类型：类型名!
//在程序架构中，第一次被赋值之后，可以确定一个可选类型_总会_有值。
var name:String!
print("name:\(name)")
name = "jack"
let EnglishName:String = name//赋值时不需要加!,因为会自动解析
print("EnglishName:\(EnglishName)")

