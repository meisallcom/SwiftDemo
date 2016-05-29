//
//  ClassA.swift
//  03协议
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Cocoa
//OC 实现协议的方法 class 类名 NSObject<协议名>
class ClassA: NSObject, TransDelegate,TransADelegate{

    override init(){
        super.init()
    }
    
    //协议TransDelegate方法的实现
    //TransADelegate 父协议TransDelegate 的方法实现
    func receiveValue(strInfo:String){
        print("receiveValue:收到\(strInfo)")
    }
    func receiveMsg(strMsg: String) {
        print("receiveMsg:收到\(strMsg)")
    }
    
}
