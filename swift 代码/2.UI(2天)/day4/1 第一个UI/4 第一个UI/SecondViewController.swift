//
//  SecondViewController.swift
//  4 第一个UI
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.orangeColor()
        // Do any additional setup after loading the view.
        //创建UIButton按钮对象
        let myBtn1=UIButton(frame:CGRect(x:100,y:400,width: 100,height: 50))
        //给按钮设置文字
        myBtn1.setTitle("关闭", forState: UIControlState.Normal)
        myBtn1.setTitleColor(UIColor.blueColor(), forState: .Normal)
        //设置按钮的点击事件
        //.TouchUpInside=UIControlEvents.TouchUpInside swift根据枚举值自动推断出它对应的枚举名是什么
        //        myBtn.addTarget(self, action: #selector(clickMe(_:)), forControlEvents: .TouchUpInside)
        myBtn1.addTarget(self, action: "closeVC:", forControlEvents: .TouchUpInside)
        //设置按钮的类型
        //myBtn.buttonType=.System
        self.view.addSubview(myBtn1)
    }
    func closeVC(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
