//
//  RegisterViewController.swift
//  08-登录注册闭包传值
//
//  Created by lujing on 16/5/11.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var username:UITextField?
    var password:UITextField?
    
    var closure:((String,String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let username = UITextField(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        username.placeholder = "请输入用户名"
        username.backgroundColor = UIColor.whiteColor()
        username.borderStyle = .RoundedRect
        self.username = username
        self.view.addSubview(username)
        let password = UITextField(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
        password.placeholder = "请输入密码"
        password.backgroundColor = UIColor.whiteColor()
        password.borderStyle = .RoundedRect
        self.password = password
        self.view.addSubview(password)
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRect(x: 100, y: 250, width: 100, height: 50)
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("返回登录", forState: .Normal)
        btn.addTarget(self, action: "backToLogIn", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)

    }
    func backToLogIn(){
        if username?.text == "" || password?.text == ""{
            let alertController = UIAlertController(title: "错误", message: "用户名或密码不能为空", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "关闭", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        closure!((username?.text)!,(password?.text)!)
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
