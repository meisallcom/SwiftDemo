//
//  RootViewController.swift
//  10 UINavigationController导航控制器
//
//  Created by manong on 16/4/6.
//  Copyright © 2016年 manong. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UserInfoDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title="码农教育";
        //放一个UIBarButtonItem
        let nextItem=UIBarButtonItem(title: "下一页", style: .Plain, target: self, action: #selector(nextPage));
        self.navigationItem.rightBarButtonItem=nextItem;
    }

    func nextPage(){
        NSLog("点击了 nextPage");
        //推出下一页
        let svc=SecondViewController();
        //正向传值:传给视图控制器2
        svc.name="张三";
        svc.setAge(15);
        svc.delegate=self;
        //推出下一个界面animated:true表示用动画形式
        self.navigationController?.pushViewController(svc, animated: true);
        
    }
    func userInfo(name:String,age:Int){
        print("name\(name) age\(age)");
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
