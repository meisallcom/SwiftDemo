//
//  TransDelegate.swift
//  03协议
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//
//协议的作用: 传值 classA传值给classB,反向传值
//协议不是类，是一种约定，声明的属性和方法 是两个类之间进行传值时，共同遵守的。

import Foundation
/*
    OC协议定义：
    @protocol 协议名称<NSObject>
        @required: //要求必须要遵守的协议，在类中必须要调用的这个方法
            协议的方法名
        @option: //协议中的方法是可选的，在类中可用可不用
            协议的方法名
    @end
 */
//在oc当中，协议它不支持多继承，不支持继承父类协议
//比如 定义协议A B 如果 协议B想继承A
//声明协议：
@objc protocol  TransDelegate:NSObjectProtocol{
    //声明协议中的方法
    //等于OC协议中的required，在类中必须要实现的协议的方法
    func receiveValue(strInfo:String)
    //oc协议中的 可选方法实现 @option定义
    //协议中的方法在类中可实现也可不实现
    optional func receiveMsg(strMsg:String)
}
//协议之间的继承
//子协议继承父协议所有的属性和方法
@objc protocol TransADelegate: TransDelegate{
    optional func receiveMsg_TransA(strMsg:String)
}