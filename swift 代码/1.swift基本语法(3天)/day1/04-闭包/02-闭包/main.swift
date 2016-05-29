//
//  main.swift
//  02-闭包
//
//  Created by lujing on 16/5/9.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//swift闭包类似于OC中的block块
//OC 1.定义block 不带参数不带返回值
// void(^myblock)()=^{
//};
//  2.block带参数带返回值
//int(^sumblock)(int,int)=^(int a,int b){
//  return a+b;
//}
// myblock()
// sumblock(1,2)

//1 最简单闭包:无参数无返回值,闭包类型为()->()
let closure = {print("hello")}
closure()
//2 有参数有返回值,类型为(Int,Int)->Int
//注意与OC的block的语法区别：没有^,而且参数和返回值类型都写在{}里面，关键字in前面是闭包类型，后面是闭包的执行体
let add = {(num1:Int,num2:Int)->Int in return num1+num2}
print(add(3,5))

//2.1 单表达式隐式返回
//单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
let add1 = {(num1:Int,num2:Int) in num1+num2}
print(add1(3,5))

//2.2 参数名称缩写：$0,$1,$2...依次可代表闭包的每个参数
var numbers = [22,3,50,9]
//sort(_:)方法被一个Int数组调用，因此其参数必须是(Int,Int) -> Bool类型的函数。因此闭包的参数类型和返回值类型均可省略。
//标准形式：
//var sortedNumbers = numbers.sort ({ (n1:Int, n2:Int)->Bool in
//    return n1 > n2
//})
//简化1：省略参数类型和返回值类型，以及return
//var sortedNumbers = numbers.sort({n1,n2 in n1>n2})
//简化2：参数缩写
//var sortedNumbers = numbers.sort({$0>$1})
//简化3：运算符函数
var sortedNumbers = numbers.sort(>)
print(sortedNumbers)

//3 尾随闭包
//将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
//形如：函数名(实参列表){长闭包} 如果函数只有闭包作为唯一参数，则可省略(),简化为函数名{长闭包}
/*Swift 的Array类型有一个map(_:)方法，其获取一个闭包表达式作为其唯一参数。
该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方
式和返回值类型由闭包来指定。*/
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let mapedNumbers = numbers.map { (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number%10]! + output
        number /= 10
    }
    return output
}
print(mapedNumbers)

//4 捕获值
//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount//捕获了runningTotal和amount两个变量的引用
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
print("incrementByTen>>>>\(incrementByTen())")//此时runningTotal和amount已经脱离原作用域，但是仍然可以被操作
print("incrementByTen>>>>\(incrementByTen())")
print("incrementByTen>>>>\(incrementByTen())")

//创建另一个incrementor，它会有属于它自己的一个全新、独立的runningTotal变量的引用：
let incrementBySeven = makeIncrementor(forIncrement: 7)
print("incrementBySeven>>>>\(incrementBySeven())")
print("incrementBySeven>>>>\(incrementBySeven())")
print("incrementBySeven>>>>\(incrementBySeven())")
//再次调用原来的incrementByTen会在原来的变量runningTotal上继续增加值，该变量和incrementBySeven中捕获的变量没有任何联系：
print("incrementByTen>>>>\(incrementByTen())")

//5 闭包是引用类型
//1 上述incrementByTen和incrementBySeven是常量，但是仍然可以修改其指向的闭包中捕获的变量的值：类似于OC中通过指针修改对象的属性
//2 如果两个常量和变量指向同一个闭包，则通过任意一个都可以操作闭包中捕获的值：类似于OC中两个指针操作同一个对象
let alsoIncrementByTen = incrementByTen
print("incrementByTen>>>>\(alsoIncrementByTen())")

