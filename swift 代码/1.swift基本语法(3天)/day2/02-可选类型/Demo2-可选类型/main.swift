//
//  main.swift
//  Demo2-可选类型
//
//  Created by lujing on 16/4/11.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//-------------------------可选类型---------------------------
//1 可选类型表示：有值，等于x或者没有值。形式：类型名?
/*Swift 的Int类型有一种构造器，作用是将一个String值转换成一个Int值。返回值是可选类型：
因为不是所有的字符串都可以转换为Int,不能转换时返回nil，如"hello"*/

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)//convertedNumber的类型被推测为Int?
print(convertedNumber)

//2 给可选变量或者常量赋值为nil，表示没有值
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

//3 没有初始化的常量或者变量会被自动赋值为nil
var surveyAnswer: String?
print(surveyAnswer)

//4 强制解析：如果确定一个可选类型有值，则可以使用名字后加!来获取值；但是
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
//如下对一个不存在的值进行!取值会导致运行错误
//var sAsr = surveyAnswer!

//5 可选绑定（optional binding）：判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
//多个可选绑定和where子句配合使用
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

//6 隐式解析可选类型：类型名!，第一次被赋值之后，可以确定它_总会_有值，不需要每次都判断和强制解析其值
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

//隐式解析可选类型是一种可以自动解析的可选类型。可以像普通可选一样进行判断和可选绑定