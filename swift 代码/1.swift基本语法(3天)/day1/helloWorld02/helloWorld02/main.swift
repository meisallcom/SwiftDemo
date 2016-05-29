//
//  main.swift
//  helloWorld02
//
//  Created by qingyun on 16/4/18.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//
//0.注释
//a.单行注释
/*
  b.多行注释
*/
//导入系统框架 Foundation 基础库
import Foundation
//main 函数
//
//打印语句
print("Hello, World!")
//1.声明常量和变量
//myvar 是变量名，
var myVar=10;//初始化值为整型，表示变量的类型为整型
//print("\(变量名)");
//NSLog("%d",myVar)
print("\(myVar)");
NSLog("打印\(myVar)");
myVar=50;
print("\(myVar)");
//OC:[NSString stringByAppend:@"字符串"]
//swift:变量名=字符串1+字符串2
print("myVar "+String(myVar));
//错误
//myVar=""
//正确的写法
myVar=Int("100")!;
print("字符串转换整型数据\(myVar)");
//2.给变量声明类型
//定义变量:表示类型为Int, 表明声明的类型为Int，变量是一个整型的数据
var myVar2:Int=20;
print("\(myVar2)");

var myVar3:Double=3.1415926;
//声明字符串类型
var myVar4:String="hello world";
// OC: YES,NO，TRUE,FALSE
// Swift:true,false
var myVar5:Bool=true //false

var myVar6=myVar2+Int(myVar3);

//3.常量声明
//值一旦确定不可改变
// OC #define const
// Swift let
let myVar7=400;
//myVar7=500;
print("\(myVar7)");
//常量的定义
let myVar8:Int=500;
print("\(myVar8)");
//4.分号
//分号可带可不带
//有一种情况例外:就在一行写多条语句
let myVar9="cat";print(myVar9)


