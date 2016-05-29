//
//  main.swift
//  06枚举
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//枚举：描述事物的属性，用不同的状态表示，这些状态 用枚举来描述。比如登陆 隐身，在线等等
/*
    c,oc枚举
    定义:
    enum{
        North=1,
        South=2,
        East=3,
        West=4
    }Direction
    调用
   Direction direct=West
*/
//swift枚举定义
//方式1
enum Direction{
    case North //0
    case South //1
    case East //2
    case West //3
}

//方式2
enum Direction1{
    case North,South,East,West
}

//使用枚举
var d=Direction.North
var d1:Direction=Direction.South;
var d2:Direction?
//nil 空值，它是一个值,不是oc当中的空地址，空指针
print("d \(d) d1\(d1) d2\(d2)")
var d3:Int?
var d4:Int!
//? 表示当前定义的数据类型可能是Int也可能不是Int，它的值，要么为ni，要么不为nil
//! 表示当前定义的数据类型一定是Int，它的值要么为nil，要么不为ni
print("d3\(d3)")
print("d4\(d4)")

var d5:Direction = .North
print("d5 \(d5)")
//编译器认为 d6是未知的类型，因为没有定义该类型为枚举
//var d6 = .North
var d7:Direction = Direction.North
switch d7{
    case .North:
        print("North")
    case .South:
        print("South")
    case .East:
     print("East")
    default:
    print("other")
}

//打印枚举值 整型数据
print(Direction.West.hashValue)

enum Course:Int{
    case Android=1,IOS,WindowsPhone,Symbian
}
var C:Course = .IOS
//hashValue 是一个哈希值，swift 自动给枚举设置的一个哈希值，它不是我们自定义的一个值

print("c \(C) \(C.hashValue)")
//真正的枚举值 对应的整型
//rawValue 是自定义枚举值 数值的时候，才有用，
var rawValue=C.rawValue
print("rawValue=\(rawValue)")

//将整型转化成 枚举值
var c2=Course(rawValue: 4)
if(c2==Course.Symbian)
{
    print("枚举值 \(c2)")
}

