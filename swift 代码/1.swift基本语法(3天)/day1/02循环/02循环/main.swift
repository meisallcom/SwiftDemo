//
//  main.swift
//  02循环
//
//  Created by qingyun on 16/4/18.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//定义一个分数
var score=80;
//定义数组
//OC: NSMutableArray socreArr0=[NSMutableArray array]
var scoreArr0=[];//定义一个空数组
var scoreArr1=Int();//数组存放的所有元素都是整型数据
//定义一个有数据的数组
var scoreArr2=[90,100,23,43,43,67];
//添加一个数组
scoreArr2.append(100);
print(scoreArr2);
print("scoreArr2 元素个数\(scoreArr2.count)")
//删除一个元素
scoreArr2.removeAtIndex(5)
print("scoreArr2 元素删除后个数\(scoreArr2.count)")

//获取数组下标的指定元素
//OC: [arr objectAtIndex:下标]
//  arr[下标]
var firstScore=scoreArr2[0]
var lastScore=scoreArr2[scoreArr2.count-1]

print("第一个元素\(firstScore) 最后一个元素\(lastScore)");

//获取最大值最小值
var minScore=0;
var maxScore=0;
var avgScore=0.0;//平均
var sumScore=0.0;//分数总和
var count=scoreArr2.count;
//1.for循环
//方式1 for in
//for(Float score in scoreArr2)
for score in scoreArr2{
    //print("score\(score)");
    //获取最小值
    if(minScore==0 || minScore>score){
        minScore=score;
    }
    if(maxScore==0 || maxScore<score){
        maxScore=score;
    }
    //在swift当中，自增++ 自减-- 不能使用
    //sumScore+=Float(score);
    //sumScore=sumScore+Double(score);
    sumScore+=Double(score);
}
//最大值
print("minScore\(minScore)")
//最小值
print("maxScore\(maxScore)")
//练习 获取 总分
print("sumScore\(sumScore)")
//方式2  for in 最小值...最大值
//OC: for(int i; score<scoreArr2.count;i++)
//显示数组中所有的元素
for i in 0 ... scoreArr2.count-1{
    print("方式2 for \(i)");
    //scoreArr2[6]
    var score=scoreArr2[i];
    print("分数 \(score)");
}

//2. repeat(do)-while 和OC当中 do-while 用法一样
//swit2.0以上版本出现报错
//do{
//
//}while(true)
var index=scoreArr2.count;
repeat{
    if(index==scoreArr2.count){
        break;
    }
}while(true)

//3.while
//数组元素打印出来
index=0;
while(index<scoreArr2.count){
    var s=scoreArr2[index];
    print("数组元素 \(s)");
    index+=1;
}

//4.switch
//字符型的数据
let appType="iOS";
switch appType{
    case "iOS":
        print("iOS");
        fallthrough //跟着往下走，执行下一个case
    case "Andriod":
        print("Android");
    case "Windows Phone":
        print("Windows Phone");
    default:
        print("没有任何匹配");
}
