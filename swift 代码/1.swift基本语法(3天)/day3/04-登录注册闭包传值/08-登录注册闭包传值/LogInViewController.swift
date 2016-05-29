//
//  LogInViewController.swift
//  08-登录注册闭包传值
//
//  Created by lujing on 16/5/11.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    var username:UILabel!
    var password:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let username = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        username.backgroundColor = UIColor.greenColor()
        self.username = username
        self.view.addSubview(username)
        
        let password = UILabel(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
        password.backgroundColor = UIColor.greenColor()
        
        self.password = password
        self.view.addSubview(password)
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRect(x: 100, y: 250, width: 100, height: 50)
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("去注册", forState: .Normal)
        btn.addTarget(self, action: "toRegister", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }
    func toRegister(){
        let regVC = RegisterViewController()
        regVC.closure = {
            self.username.text = $0
            self.password.text = $1
        }
        self.presentViewController(regVC, animated: true, completion: nil)
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
