//
//  FirstViewController.swift
//  02 导航控制器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.orangeColor()
        //给导航条添加标题
        self.title="青云教育"
        //
        let nextItem=UIBarButtonItem(title:"下一页",style: .Plain,target:self, action:"nextPage")
        
        self.navigationItem.rightBarButtonItem=nextItem
        
    }
    func nextPage() {
        NSLog("nextPage")
        let sVc=SecondViewController()
        self.navigationController?.pushViewController(sVc, animated: true)
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
