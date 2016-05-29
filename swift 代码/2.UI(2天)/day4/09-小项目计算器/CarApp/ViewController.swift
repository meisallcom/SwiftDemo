//
//  ViewController.swift
//  CarApp
//
//  Created by Tan on 15/9/16.
//  Copyright (c) 2015 MAC. All rights reserved.
//  Swift入门练习 - 简单四则运算计算器

/*  已完成：
*        - 整数、浮点数的四则运算
*   待补全:
*       - 按钮图片
*
*   后期：根据设计模式，改写代码
*/
//讲课的思路

import UIKit
import Foundation

class ViewController: UIViewController {

    var value = "" //输入的值
    var operand = "" //操作符 加减乘除
    var operators = "" //操作数
    var resultOfCal = ""
    
    @IBOutlet weak var TextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //去掉结果中多余的0
    func deleteZero(var deleteChar :String) ->String{
        var stringLength :Int = 0
        stringLength = deleteChar.characters.count
        for var i = stringLength ; i > 0 ; i-- {
            var charLocation :String = ""
            charLocation = (deleteChar as NSString).substringWithRange(NSMakeRange(i - 1, 1))
            if charLocation == "0"  {
                deleteChar = (deleteChar as NSString).substringToIndex(i - 1)
            }else if charLocation == "." {
                deleteChar = (deleteChar as NSString).substringToIndex(i - 1)
                break
            }else{
                break
            }
        }
        return deleteChar
    }
    //删除
    func deleteOfCal(deleteCh :String) ->String {
        
        var textCount : Int = 0
        //计算结果 - 字符串长度
        for ch in deleteCh.characters {
            textCount++
        }
        let chCount : Int = deleteCh.characters.count
        print("字符串长度为：\(chCount)")
        //截取字符串
        let tempChar = (deleteCh as NSString).substringToIndex(textCount-1)
        print("截取的字符串为：\(tempChar)")
        return tempChar
    
    }
    //判断是否是数字或加减符号
    func isNumber( valueIsNum : String) -> Bool {
        switch valueIsNum
        {
            case "0","1","2","3","4","5","6","7","8","9","." :
                return true
        default :
                return false
        }
    }
    
    //输入等号时的运算过程
    func countOfCalculator(resultOfcal1 :String , operand1 :String , operators1 :String) ->Double {
        
        //将 String 转换成 double 类型
        var resultOfCalDouble =  (resultOfcal1 as NSString).doubleValue
        let operatorsDouble = (operators1 as NSString).doubleValue
        
        switch operand1
        {
            case "+":
                resultOfCalDouble += operatorsDouble
                print("加法结果为：\(resultOfCalDouble)")
            case "-":
                resultOfCalDouble -= operatorsDouble
                print("减法结果为：\(resultOfCalDouble)")
            case "*":
                resultOfCalDouble *= operatorsDouble
                print("乘法结果为：\(resultOfCalDouble)")
            case "/":
                resultOfCalDouble /= operatorsDouble
                print("除法结果为：\(resultOfCalDouble)")
        default:
            print("Error 4 calculator")
            
        }
        return resultOfCalDouble
    }
    
    //输入符号时的处理过程
    func notNum(valueIsNotNum :String){
        //print(operators.characters.count)
        switch valueIsNotNum
        {
            //双操作符情况
            case "+","-","*","/" :
                resultOfCal = operators
                operand = valueIsNotNum
                TextInput.text = operand
                operators = ""
            //单操作符情况
            case "C","AC","+/-":
                switch valueIsNotNum
                {
                    case "C":
                        if(operators.characters.count>0){
                            operators = (operators as NSString).substringToIndex(operators.characters.count-1)
                            print("input \(operators)")
                            TextInput.text = operators.characters.count>0 ? operators:"0"
                            
                        }else{
                            TextInput.text="0"
                        }
                        break
                    case "AC" :
                        operators = ""
                        TextInput.text = ""
                    case "+/-" :
                        
                        for ch in operators.characters {
                            if ch == "-" {//如果是负数，去掉负号
                                operators = (operators as NSString).substringFromIndex(1)
                                break
                            }else{//如果是负数，添加负号
                                operators = "-" + operators
                                break
                            }
                        }
                        TextInput.text = operators
                default:
                    print("end of single operand")
                }
            case "=" :
                var resultOfCalDouble :Double = 0.0
                resultOfCalDouble = countOfCalculator(resultOfCal , operand1: operand , operators1: operators)
                //将结果由 double 类型转换成 string 类型，以便显示 -----
                resultOfCal = String(stringInterpolationSegment: resultOfCalDouble)
                //去掉结果中多余的0
                resultOfCal = deleteZero(resultOfCal)
                TextInput.text = resultOfCal
                //清空计算变量
                resultOfCal = ""
                operators = ""
        default:
            print("value of button is not clear", terminator: "")
        }
        
    }
    
    @IBAction func didTouch(sender: UIButton) {
        
        value = sender.currentTitle!
        let valueOfButten : Bool = isNumber(value)
        
        if valueOfButten == true {
            operators += value
            TextInput.text = operators
        }else{
            notNum(value)
        }

    }
    @IBAction func btn(sender:UIButton){
    
        print("\(sender.tag)")
    
    }

}

