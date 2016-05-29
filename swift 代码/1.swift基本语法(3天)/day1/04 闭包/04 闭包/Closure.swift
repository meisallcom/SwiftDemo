//
//  Closure.swift
//  04 闭包
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation
//OC 1.定义block 不带参数不带返回值
// void(^myblock)()=^{
//};
//  2.block带参数带返回值
//int(^sumblock)(int,int)=^(int a,int b){
//  return a+b;
//}
// myblock()
// sumblock(1,2)

//swift Closure 和oc block类似
func hasClosureMatch(arr:[Int],value:Int,cb:(num:Int,value:Int)->Bool)->Bool{
    
    for item in arr{
        if(cb(num: item, value: value)){
            return true;
        }
    }
    return false;
}