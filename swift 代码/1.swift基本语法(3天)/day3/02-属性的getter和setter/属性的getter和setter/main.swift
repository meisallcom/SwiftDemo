//
//  main.swift
//  属性的getter和setter
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
let p=Person()
//自动调用属性的设置器setter
p.name="张三"
print(p.storeName)
//自动调用属性的获取器getter
print(p.name)

p.age=15

