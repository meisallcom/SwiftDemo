//
//  SecondViewController.swift
//  10 UINavigationController导航控制器
//
//  Created by manong on 16/4/6.
//  Copyright © 2016年 manong. All rights reserved.
//

import UIKit
//定义一个协议
protocol UserInfoDelegate:NSObjectProtocol {
    //定义一个协议函数/代理的一个函数
    //参数1 用户名
    //参数2 年龄
    func userInfo(name:String,age:Int)
}
class SecondViewController: UIViewController{
    /*区别:
     public 可以访问自己模块中源文件里的任何实体,别人也可以通过引入该模块来访问源文件里的所有实 体。通常情况下,   中的某个接口是可以被任何人使用时,你可以将其设置为   级别，编写framework时 使用public。
     internal 可以访问自己模块中源文件里的任何实体,但是别人不能访问该模块中源文件里的实体
     private 能在当前源文件中使用的实体,称为私有实体。使用   级别,可以用作隐藏某些功能的 实现细节。
     
     */
    internal var name :String = "";
    private var age:Int = 0;
    
    weak var delegate:UserInfoDelegate?;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title="视图控制器二";
        //设置背景颜色
       self.view.backgroundColor=UIColor.redColor();
        //设置按钮
        let b=UIButton(type:.System);
       
        let frame=CGRect(x:100,y:100,width: 100,height: 40);
        b.frame=frame;
        //设置按钮上的标题
        b.setTitle("返回上一层", forState: .Normal);
        
        //给按钮加上点击事件,调用self.clickMe
        b.addTarget(self, action:#selector(clickMe), forControlEvents: .TouchUpInside);
        self.view.addSubview(b);
        
        print(self.name);
        print(self.age);
        
        let b1=UIButton(type:.System);
        
        let frame1=CGRect(x:100,y:200,width: 100,height: 40);
        b1.frame=frame1;
        //设置按钮上的标题
        b1.setTitle("反向传值之代理", forState: .Normal);
        
        //给按钮加上点击事件,调用self.clickMe
        b1.addTarget(self, action:#selector(transValue), forControlEvents: .TouchUpInside);
        self.view.addSubview(b1);
        
    }
    func clickMe(sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func setAge(nAge:Int){
        self.age=nAge;
        
    }
    func transValue(sender:UIButton){
        if((self.delegate) != nil){
            self.delegate?.userInfo("李四", age: 20);
            //self.delegate.userInfo("李四", age: 20);
        }
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
