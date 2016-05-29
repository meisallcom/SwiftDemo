//
//  main.swift
//  03函数
//
//  Created by qingyun on 16/4/18.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation
//swift 不需要写import function,在main.swift当中会自动调用function.swift文件，从而引用此文件中的所有函数
print("Hello, World!")
 //oc 空函数
  //void func(){
  //}
 //swift 空函数声明
//func 是function 英文缩写
func testFunc(){
    print("空函数")
}
//swift函数的调用
testFunc()
//oc: [function testConcat:str1 str2:str2]
//swift当中函数特殊调用方法，因为没有对象,类，所以只需要调用function.swift文件中的函数
var retInfo=testConcat("4月", str2: "18日");
print(retInfo)

testFunction()

