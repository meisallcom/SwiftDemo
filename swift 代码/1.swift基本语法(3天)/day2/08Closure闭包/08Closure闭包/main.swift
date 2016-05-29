//
//  main.swift
//  08Closure闭包
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//在swift 闭包 其实是一个函数的代码块
//swift 闭包表达式 定义格式：
//{(传入的参数列表)->返回值 in
// 相关的代码块
//}
//
//闭包的表达式（Closure，不是用block表示）
//1.Sort方法
let names=["A","B","C","D","E"]
func backwards(s1:String, s2:String) ->Bool{
    print("s1 \(s1) s2 \(s2)")
    return s1>s2
}

var reversed=names.sort(backwards)
print("排序后\(reversed)")
//2.根据上下文推断类型 显式返回
var reversed1=names.sort({
    //swift闭包
    s1,s2 in return s1>s2 //返回一个逻辑值
});
print("2.排序后\(reversed1)")
//3.闭包表达式 隐式返回
var reversed2=names.sort({
   s1,s2 in s1>s2 //返回一个逻辑值
})
print("3.排序后 \(reversed2)")

//4.参数名称的缩写 不带in
// $0 表示s1
// $1 表示s2
var reversed3=names.sort { $0 > $1 }
print("4.排序后\(reversed3)")

//5.捕获值
//函数1中的函数2
func makeIncrement(forIncrement amount:Int)->()->Int{
    var total=0
    print("makeIncrement函数")
    func incrementor()->Int{
        print("incrementor 函数")
        total += amount
        return total
    }
    return incrementor
}

//incrementbyTen 等于 incrementor 函数
//调用函数1 makeIncrement
let incrementbyTen=makeIncrement(forIncrement: 10)
//调用函数2 incrementor
//total= 0
var ret0=incrementbyTen()
print("ret0=\(ret0)")
//total=10
var ret1=incrementbyTen()
print("ret1=\(ret1)")

//total=20




