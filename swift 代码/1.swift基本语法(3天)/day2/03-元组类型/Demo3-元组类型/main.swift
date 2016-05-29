//
//  main.swift
//  Demo3-元组类型
//
//  Created by lujing on 16/4/11.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Foundation

//-----------------------元组的基本使用----------------------------
let data = ()//空元组

let httpStatus = (404,"Not Found")
//1 可以指定元素的类型
var person: (Int,String) = (23,"rose")
//2 可以给元素加名称
var person1 = (age:25,name:"jingjing")
//3 类型和名称不能共存：在明确指出元素类型的情况下不能加上元素的名称
var person2: (Int,String) = (age:22,name:"xiaocao")
//4 元素的访问：通过下标或者元素名称
print(person.0)
print(person1.0)
print(person1.name)
//print(person2.name)//原因：3.3

//5 改变元素的值
person = (26,"小草")//元组变量可以，常量不可以
print(person)

//6 可以用多个变量接收元组数据
var (age,name) = (30,"lilei")

//7 可以将元素分别赋值给多个变量
var (age1,name1) = person
print(age1)
print(name1)

//8 可以用下划线_忽略某个元素的值，从而取出其他的元素

var (_,name2) = person1
print(name2)

/*⚠️⚠️注意：
元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或
结构体而不是元组。
*/