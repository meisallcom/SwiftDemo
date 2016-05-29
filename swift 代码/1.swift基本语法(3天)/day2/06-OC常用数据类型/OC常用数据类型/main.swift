//
//  main.swift
//  OC常用数据类型
//
//  Created by lujing on 16/5/13.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//1.NSString
var str:NSString = "111"//str定义成var,是可变字符串
str = str.stringByAppendingString("def")
print(str)
//使用NSLog打印

NSLog("%@", str)//
let lstr:NSMutableString = "123"
lstr.stringByAppendingString("xxx")
print(lstr)
lstr.appendString("vvv")
print(lstr)
//字符串截取
var subString = lstr.substringWithRange(NSMakeRange(1, 3))
print(subString)

//2 字符串类型转换
//2.1 整型
//字符串转Int
var strValue = "345"
//方式1：String->Int
let intValue = Int(strValue)!
print(intValue)
//方式2: NSString->Int
let intValue1 = str.integerValue
NSLog("%d", intValue1)

//Int转字符串
//方式1:Int->String
var strValue1 = String(intValue)
NSLog("%@", strValue1)
//方式2：
var strValue2 = NSString(format: "%d", intValue1)
print(strValue2)

//2.2 布尔值
var strFlag:NSString = "0"
let flag:Bool = strFlag.boolValue
print(flag)

//2.3 浮点型
var strFloat:NSString = "12.345"
let fValue = strFloat.floatValue

//3 数组
var arr:NSMutableArray = NSMutableArray()
arr.addObject("张三")
arr.addObject("李四")
arr.addObject("王五")
for i in 0..<arr.count {
    var strValue:NSString = arr[i] as! NSString
    NSLog("数组元素：%@", strValue)
    NSLog(">>>\(strValue)")
    //NSLog("%@", arr[i])
}

//4 字典
var dict:NSMutableDictionary = NSMutableDictionary()
//插入数据
//方式1 推荐
dict["姓名"] = "张三"
//方式2
dict.setObject("年龄", forKey: "age")

for (key,value) in dict{
    print("key \(key):value \(value)")
}

//5 NSDate日期
//方式1 使用OC中的NSDate类型
//获取当前时间
let now = NSDate()
print(now)
let nowStr = now.stringValue//使用属性
print(nowStr)
let nowStr1 = now.string()//使用方法
print(nowStr1)

//方式2：自定义时间
let someDateStr = "2015-10-04 12:23:34"
let someDate = NSDate.dateFromString(someDateStr)
print(someDate)

print(someDate.compare(now).rawValue)
print(NSComparisonResult.OrderedDescending.rawValue)//降序

let result = someDate.compare(now)
if result == NSComparisonResult.OrderedSame {
    print("相等")
} else if result == NSComparisonResult.OrderedAscending{
    print("升序")
} else if result == .OrderedDescending {
    print("降序")
}

//6 NSData
//字符串转NSData
let strData = "hello,NSData!"
let data = strData.dataUsingEncoding(NSUTF8StringEncoding)!
print("data:\(data)")
//NSData 转字符串
let strData1 = String(data: data, encoding: NSUTF8StringEncoding)!
let strData2 = NSString(data: data, encoding: NSUTF8StringEncoding)!
print(strData1)
print(strData2)

//NSData写文件
data.writeToFile("/Users/lujing/Desktop/Swift/备课/卢/03——面向对象语法/OC常用数据类型/datafile", atomically: true)
//NSData读取文件
let data1 = NSData(contentsOfMappedFile: "/Users/lujing/Desktop/Swift/备课/卢/03——面向对象语法/OC常用数据类型/jsonfile.rtf")
let strOfData1 = String(data: data1!, encoding: NSUTF8StringEncoding)!
print(strOfData1)