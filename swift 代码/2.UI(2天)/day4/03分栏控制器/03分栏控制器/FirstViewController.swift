//
//  FirstViewController.swift
//  03分栏控制器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.redColor()
        //导航条的标题，选项卡的标题
       // self.title="视图控制器1"
        //只设置导航条的标题
        self.navigationItem.title="视图控制器1"
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
