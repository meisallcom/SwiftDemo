//
//  ViewController.swift
//  08 UIStoryboard故事板的使用
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //打开下一级视图控制器
        //源视图控制器：上一级视图控制器
        //目标视图控制器：即将要打开的视图控制器
        if segue.destinationViewController.isKindOfClass(FirstViewController){
            NSLog("进入视图控制器1")
            
        }
        
    }
    @IBAction func cancelSegue(segue:UIStoryboardSegue){
        NSLog("cancelSegue")
        //下一级视图控制器返回到上一级视图控制器
        //下一级视图控制器 源视图控制器 上一级视图控制器 是目标视图控制器
        if segue.sourceViewController.isKindOfClass(FirstViewController) {
            NSLog("返回至视图控制器1")
        }
    }

}

