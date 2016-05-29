//
//  main.swift
//  07 结构体
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
print("结构体")
/*
    c,oc定义结构体
    struct STestStruct{
      int x,
      int y
    }STest;
    STest.x=10

    OC:
        ClassA *A=[[ClassA alloc] init]
    init 是一个构造函数，对象在分配内存空间之后，先进行初始化
    dealloc 是一个析构函数，对象销毁之前，要调用的方法
    init dealloc 是NSObject中的方法
*/
//swift结构体
struct STest{
    //1.定义一个结构体
    var x=0;//当做oc中的一个对象中的属性property
    var y=0;
    //2.定义结构体中的构造函数
    //构造函数 是初始化函数
    //在声明一个结构体对象的时候，会自动调用init方法
    //a.不带参数的构造函数
    init(){
        print("初始化")
        x=30
        y=25
    }
    //b.带参数名的构造函数
    init(x:Int,y:Int){
        self.x=x
        self.y=y
    }
    //c.不带参数名传值的构造函数
    init(_x:Int,_y:Int){
        self.x=_x
        self.y=_y
    }
    //d.实现结构体的一个方法/函数
    func getCenter() ->Int{
        return x+y
    }
    //e.结构体有构造函数，没有析构函数
    //g.实现以个结构体的方法
    mutating func addOffset(deltaX:Int,deltaY:Int){
        x=x+deltaX
        y=y+deltaY
    }
    
    
}

func testStructure(){
    //定义一个结构体
    let s1=STest();
    
//    s1.x=10
//    s1.y=20
    
    print("s1.x=\(s1.x) s1.y=\(s1.y)")
    
    var s2=STest(x: 50, y: 100)
    print("s2.x=\(s2.x) s2.y=\(s2.y)")
    //调用结构体对象中的一个方法
    let center=s2.getCenter()
    print("center=\(center)")
//    var s3=STest(60,120)
//    print("s3.x=\(s3.x) s3.y=\(s3.y)")
    s2.addOffset(100, deltaY: 200)
    print("s2 x=\(s2.x) y=\(s2.y)")
    
}
testStructure()