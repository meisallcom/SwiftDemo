//
//  function.swift
//  03函数
//
//  Created by qingyun on 16/4/18.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation
//1.
/*
  OC 带传入参数 带返回值的函数声明 实现
  NSString testConcat:(NSString *)str1 str2:(NSString *) str2{
    return str2;
  }
*/
//swift 带传入参数 和返回值的 函数声明实现

func testConcat(str1:String,str2:String) ->String{
    
    return "str1=\(str1) str2\(str2)"
}
//2.swift函数类似oc 函数 传入参数风格
func testConcat1(str1:String,andStr2 str2:String ,andNumber nValue:Int)->String{
    return "str1=\(str1) str2=\(str2) nValue=\(nValue)"
}
//3.函数返回多个参数
//name1,type1 language1 传入参数
//name,type,language 传出的参数作为 返回值
func testConcat2(name1:String,type1:String,language1:String)->(name:String ,type:String,language:String){
    //多个参数设置为返回值
    return (name1,type1,language1)
}
//4.函数中的函数
func testConcat3(var index:Int)->Int{
    index+=1;
    //声明实现一函数中的函数 add
    //此函数使用范围在此函数体内testConcat3
    func add(){
        index+=1
    }
    add()
    return index;
}
//5.返回一个函数地址 addOne
//Int->Int
//1.Int 传入的参数
//2.Int 传出的参数 addOne 返回值类型
func returnFuncPonter()->(Int->String){
    func addOne(num:Int)->String{
        return String(num+5)
    }
    return addOne
}

func getFuncPointer()->(Bool->Float){
    func subFunc(flag:Bool)->Float{
        if flag{
            return 5.0
        }else{
            return 1.0
        }
        
    }
    return subFunc
}

func testFunction(){
    print("testFunction")
    let strInfo=testConcat1("1", andStr2: "2", andNumber: Int("3")!)
    
    print(strInfo)
    
    let strInfo1=testConcat2("青云", type1: "iOS", language1: "swift")
    //函数返回值为多个参数，获取其中的一个值
    //name 可以看做是strInfo1的其中的一个属性
    let name=strInfo1.name
    let name1=strInfo1.0
    let type=strInfo1.type
    print(name+"  "+name1+"  "+type)
    print(strInfo1);
    let index=testConcat3(10);
    print(index)
    
    //获取函数的内存地址
    //获取函数的地址 addOne 
    //funcPointer=addOne
    let funcPointer=returnFuncPonter();
    print(funcPointer)
    //funcPointer(10)=addOne(10)
    let v7=funcPointer(10);
    print("v7= \(v7)")
    
    //func1Pointer获取到的是 subFunc函数
    let func1Pointer=getFuncPointer();
    
    let v8=func1Pointer(true);
    print("\(v8)")
    
}



