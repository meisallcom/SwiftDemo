//
//  ClassB.swift
//  03协议
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Cocoa

class ClassB: NSObject {
    var classA:ClassA
    //声明代理
    var delegate:TransDelegate
    var delegateA:TransADelegate
    //classB初始化
    override init(){
        
        //初始化classA对象
        classA=ClassA()
        //代理的前提是 对象必须要实现协议的方法，否则会出现报错
        self.delegate=classA
        self.delegateA=classA
        super.init()
        
    }
    //定义测试方法
    func test(strInfo:String){
        //调用代理中的方法
        //向ClassA传值
        delegate.receiveValue(strInfo)
    }
    
    func test1(strInfo:String){
        //调用代理的方法,向classA传值
        delegateA.receiveValue(strInfo)
    }
    
}
