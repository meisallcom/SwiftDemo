//
//  main.swift
//  01-函数
//
//  Created by lujing on 16/5/9.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//1 最简单的函数：无参数无返回值
func printHello(){//函数定义关键字func,()为空表示不需要参数
    print("Hello")
}
printHello()//函数调用

//全局的变量、常量和函数会在源文件的最顶级被自动声明
yes = "no"
testFunc()//区别于C和OC，不需要手动加入函数声明,main.swift会自动导入testFunc.swift文件,从而调用到testFunc文件中的所有函数

//2 无参有返回值函数
func someString() ->String {
    return "Hello,world!"
}
var str = someString()
print(str)

//3 无参多返回值函数：返回元组
func maxAndMin() -> (Int,Int){
    var array = [3,0,-2,5]
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
var (min,max) = maxAndMin()
print("最小：\(min)最大：\(max)")

//4 带参数函数
//>>>>>>>>>>>函数参数名称：
/*外部参数名: 调用时使用
内部参数名: 定义时在函数体内使用
*/
//4.1 第一个参数省略外部参数名，第二个及后面的使用局部参数名作为外部参数名
//类似OC的initWithName:(NSString*)name andAge:(int)age风格
func add(num1:Int,num2:Int){
    print("\(num1) + \(num2) = \(num1+num2)")
}
add(5, num2: 4)//num2既是外部参数名又是局部参数名

//4.2 指定外部参数名：外部参数名 局部参数名：类型名
func travel(from starting:String,to destination:String){
    print("someone travels from \(starting) to \(destination)")
}
travel(from: "zhengzhou", to: "paris")

//4.3 忽略外部参数名：_代替
func mul(num1:Int,_ num2:Int){
    print("\(num1) * \(num2) = \(num1*num2)")
}
mul(3, 6)

//4.4 默认参数值:不传实参则使用默认值
func numPrefix(prefix:String = ""){
    print("num uses the prefix:\(prefix)")
}
numPrefix()//数默认为十进制，没有前缀
numPrefix("0b")//二进制前缀0b
//4.5 可变参数：数量不确定
func eatLunchAtCompany(persons:String...){
    print("今天中午在公司吃饭的人有 \(persons.count)个.")
    guard persons.count > 0 else {return}
    print("他们分别是:",terminator:"")
    for person in persons {
        print("\(person)",terminator:" ")
    }
    print("")
}
eatLunchAtCompany("尤老师","张老师","胡老师")
eatLunchAtCompany()

//4.6 常量参数和变量参数: 默认函数参数不能修改，如果在函数体内修改参数，需要使用var声明,但是其修改对外不可见
func RMBFromDollar(var money:Double) -> Double {
    money *= 6.4834
    return money
}
let dollar:Double = 100
print(RMBFromDollar(dollar))
print(dollar)

//4.7 输入输出参数：inout声明的参数，可以被函数体修改，且会改变函数体外的原始值。传参时需传入变量的地址。相当于C语言指针操作
func swap(inout a:Int,inout b:Int){
    let temp = a
    a = b
    b = temp
}
var numA = 5
var numB = 7
print("交换前：numA:\(numA),numB:\(numB)")
swap(&numA, b: &numB)
print("交换后：numA:\(numA),numB:\(numB)")

//5 函数类型
//5.1 作为变量或者常量的类型：相当于函数指针类型
var calcFunc:(Int,Int) -> Void = add
calcFunc(1,2)
calcFunc = mul
calcFunc(1,2)

//5.2 作为函数的参数类型：用于回调
func callBack(mathFunction:(Int,Int)->Void,a:Int,b:Int){
    mathFunction(a,b)
}

callBack(add, a: 3, b: 5)

//5.3 作为返回值类型，可用于外围函数返回其内部嵌套的函数，使其在外部可用
//嵌套函数：定义在别的函数体内的函数，实现局部功能封装
func makeIncrementer() -> (Int) -> Int {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()

print("\(increment(5))")