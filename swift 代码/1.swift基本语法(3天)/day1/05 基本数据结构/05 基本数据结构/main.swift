//
//  main.swift
//  05 基本数据结构
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//1.String 字符串 
var p1=100
let p2="value is"+String(p1)
print("p2 \(p2)")
//判断字符串是否为空
if p2.isEmpty{
    print("不为空")
}
//character字符类型 string 字符串是由多个character字符类型的数据组成
for character in "Dog!🐶".characters {
    print(character)
}
//将多个character字符组成字符串String
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catCharacters)
//给字符串添加字符
let exclamationMark: Character = "!"
catString.append(exclamationMark)
//给指定位置添加字符
var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)

//将其他类型数据转换成字符串数据
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//统计字符个数
let count=message.characters.count;

//集合类型 即存储指定类型的多个值。
//集合有三种类型：Array,Dictionary,Sets
//2.数组
var p3=["iOS","Android","Windows Phone"]
//显示所有元素
//方式1.
for item in p3{
    print("item \(item)")
}
//方式2.
for (index, value) in p3.enumerate() {
    print("Item \(index + 1): \(value)")
}
//数组的末尾添加一条记录
p3.append("BlackBerry")
//或者这样添加一条记录
p3+=["Symbian"]
//给数组末尾添加多条记录
p3+=["J2ME","Windows Mobile"]
//在指定位置添加记录
p3.insert("iOS9.3", atIndex: 0)
//删除最后一个元素
p3.removeLast()
//删除数组第3个元素
p3.removeAtIndex(2);
print(p3)
//删除数组中所有元素
//p3.removeAll()
//判断数组是否为空
if p2.isEmpty{
    print("为空")
}else{
    print("不为空")
}

print("p3 \(p3.count)")
var pa=p3[0];


//3.字典
//OC NSDictionary *dict=[NSDictionary initWith key:value,key1:value1,nil]
var p4=["Name":"张三","Age":"20","Score":"100"]
//把字典中所有数据提取出来
for(key,value) in p4{
    print("key=\(key) value=\(value)")
}
var name=p4["Name"]
print(name)
//给字典追加内容
p4["Address"]="郑州市"
print(p4)

//把字典中所有的key值提取出来
let p5=p4.keys
for key in p5{
    let v=p4[key]
    print("key is\(key)=\(v)")
}

//4.创建空集合
var genres = Set<String>()
let types = Set<Int>()
//通过集合语义来创建
var vgenres: Set<String> = ["Rock", "Pop", "Jazz"]
//检查集合元素个数
print(vgenres.count)
//判断是否为空集合
if genres.isEmpty{
    print("集合为空")
}
//判断集合是否包含指定值
// 检测集合是否包含某值
if genres.contains("Funk"){
    print("存在此值")
}else{
    print("不存在此值")
}
//插入一个值
// 集合中加入一个值
genres.insert("Classical")
// 集合中删除一个值
genres.remove("Jazz")
//遍历集合
for genre in genres.sort() {
    print(genre)
}




//5.元祖
//方式1. swift 变量初始化设置值的时候，自动把变量的数据类型给设置好了，后面再次赋值的时候，数据类型保持一致，如果不一致的情况下，会出现报错
//(404,"Not Found")  =(Int,String)
//命名规则  元组名=(值1，值2)
var http404Error=(404,"Not Found")
print(http404Error)
//类型不一致 导致报错
//http404Error=("not found",404)
print("code =\(http404Error.0) msg=\(http404Error.1)")
var (statusCode ,statusMessage)=http404Error
print("statusCode=\(statusCode) statusMessage= \(statusMessage)")

(statusCode,statusMessage)=(200,"Found")
print("statusCode \(statusCode) statusMessage \(statusMessage)")
//方式2
//命名规则 元祖名=(参数名1:值，参数名2:值)
let http200Status=(statusCode:200,message:"网络正常")
print("statusCode\(http200Status.statusCode)")

//元祖的用途： 1.作为函数的返回值，返回多个值 2.组建临时的数据，数据量小的时候用元祖，数据量多的时候用结构体，或者类(实体)