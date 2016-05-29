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
//合并
var p1=100
let p2="value is"+String(p1)
//删除
print("p2 \(p2)")


//2.数组
var p3=["iOS","Android","Windows Phone"]
for item in p3{
    print("item \(item)")
}
//数组的末尾添加一条记录
p3.append("BlackBerry")
//删除数组第3个元素
p3.removeAtIndex(2);
print(p3)
//删除数组中所有元素
//p3.removeAll()
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

//4.元祖
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