//
//  SecondViewController.swift
//  02 导航控制器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.greenColor()
        let btn=UIButton(frame:CGRect(x:100,y:200,width: 100,height: 50))
        btn.setTitle("关闭视图控制器", forState: .Normal)
        btn.addTarget(self, action: "CloseVC", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }
    func CloseVC(){
        //导航控制器 pop 和 push 配对使用的，
        //视图控制器 present dismiss 配对使用的
        self.navigationController?.popViewControllerAnimated(true)
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
