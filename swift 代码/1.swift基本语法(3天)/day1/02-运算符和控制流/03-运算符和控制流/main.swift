//
//  main.swift
//  03-运算符和控制流
//
//  Created by lujing on 16/5/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//对比OC,运算符主要有以下区别：

//1 赋值运算符不返回值，避免==误写为=造成判断错误
var aa = 5
var bb = 6
if aa == bb{//此处aa = bb有语法错误
    print("aa和bb相等")
}

//2 算术运算符（+ - * /）不支持溢出
//var aaa = Int8.max + 1
//var aaa = Int8.min - 1

//3 取余运算符%,可以操作浮点型
var dd = 8%2.5
print(dd)

//4 ++和--,也可操作浮点型
dd++
dd--

//5 + - 正负号
let three = 3
let minusThree = -three
let plusThree = +three

//6 空合运算符：a??b 意为 a != nil ? a! : b,a必须是可选类型，如果a有值，则取出a的值，反之返回默认值b
//注意：b的类型 要和a存储的值的类型一致
//下面实现了在默认颜色名和可选自定义颜色名之间抉择：

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

//7 区间运算符：闭区间：a...b，半开区间：a..<b，不包含b
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

//半开区间的实用性在于当你使用一个从 0 开始的列表（如数组）时，非常方便地从0数到列表的长度。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

//--------------------------控制语句---------------------------------
//对比OC,控制语句的区别主要有以下几点：
//1 if 条件不需要使用括号，但是执行体必须使用括号
var score = 70
if score >= 60 {
    print("恭喜你，及格了！")
} else {
    print("不好意思，你挂科了，需要补考。。。")
}

//2 if的条件必须是布尔值。“非0即真”不再适用
//if -1 {
//    print("-1 为真")
//}

//3 guard语句：guard 条件 else {}
func checkup(person: [String: String!]) {
    
    // 检查身份证，如果身份证没带，则不能进入考场
    guard let id = person["id"] else {
        print("没有身份证，不能进入考场!")
        return
    }
    
    // 检查准考证，如果准考证没带，则不能进入考场
    guard let examNumber = person["examNumber"] else {
        print("没有准考证，不能进入考场!")
        return
    }
    
    // 身份证和准考证齐全，方可进入考场
    print("您的身份证号为:\(id)，准考证号为:\(examNumber)。请进入考场!")
    
}
checkup(["id": "123456"]) // 没有准考证，不能进入考场!
checkup(["examNumber": "654321"]) // 没有身份证，不能进入考场!
checkup(["id": "123456", "examNumber": "654321"]) // 您的身份证号为:123456，准考证号为:654321。请进入考场!

//if 和 guard的对比：
/*
(1)id和examNumber可以在guard语句之外使用，也就是说当guard对其表达式进行验证后，id和examNumber可在整个方法的作用域中使用，并且是解包后的。但是if中解包后的变量只能在if后面的{}里面使用
(2)guard语句就是在声明判断条件时,可以直接写上你需要的条件(或者区间)，而不必去谨慎地寻找该区间的补集，也避免了层层条件的嵌套，相对来说能减少错误(主要是遗漏)，而且代码review时思路能更清晰。
(3)guard有些类似assert，但是assert条件不满足会崩溃，但是guard可以优雅的退出而非崩溃
*/

//4 switch语句 ：不需要使用break，且case可以对应多个模式，则逗号隔开
var year = "闰年"
var month = 3
switch month {
case 1,3,5,7,8,10,12:
    print("\(month)月有31天")
case 4,6,9,11:
    print("\(month)月有30天")
case 2:
    if year == "闰年" {
        print("\(year)\(month)月有29天")
    }
    else if year == "平年" {
        print("\(year)\(month)月有28天")
    }
default:
    print("不合法的月份")
}

//4.1 case可以匹配区间
var age = 17
switch age{
case 0...6:
    print("\(age)岁属于儿童")
case 7..<18:
    print("\(age)岁属于少年")
case 18...40:
    print("\(age)岁属于青年")
case 41...65:
    print("\(age)岁属于壮年")
default:
    print("\(age)岁属于老年")
}

//4.2 匹配元组和值绑定
//下例展示了如何使用一个(Int, Int)类型的元组来分类图中的点(x, y)：
//图见：坐标图
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, let y)://值绑定
    print("on the y-axis with a y value of \(y)")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
//4.3 显示贯穿:fallthrough
var time = "下午"
print("\(time):",terminator:"")
switch time {
case "下午":
    print("技术分享完",terminator:"")
    fallthrough//直接跳入下一个case分支
    print("会执行吗？")//不会执行
case "上午":
    print("上课")
default:
    print("不上课")
}

//5 for和for-in：常用于遍历区间、数组、字典、字符串等
//乘法表
for i in 1...9 {
    for j in 1...i {
        print("\(i)*\(j) = \(i*j)",terminator:" ")
    }
    print("\n")
}
//如果你不需要知道区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问：
let base = 3
let power = 4
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//6 while和repeat-while(等同于OC中的do-while)
var sum = 0
var n = 1
while n <= 5 {
    sum += n
    n++
}
print("sum = \(sum)")

repeat {//第一次不判断条件，直接执行一次
    n++
    print("n:\(n)")
}while n <= 5

//7 复杂语句嵌套时，支持加标签
var m = 1
var num = 0

OutsideLoop:while m <= 10 {
    for k in 0..<m {
        print("*",terminator:"")
        num++
        if num > 20 {
            break OutsideLoop//不加标签，默认跳出当前循环体
        }
    }
    print("\(m)")
    m++
}
