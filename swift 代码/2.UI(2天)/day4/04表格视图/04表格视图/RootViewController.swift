//
//  RootViewController.swift
//  04表格视图
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView! = nil //定义表格视图的对象
    var dataArr=NSMutableArray() //用oc的数据类型
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<10 {
            dataArr.addObject("第\(i)行")
        }
        
        //初始化表格视图对象
        tableView=UITableView(frame: CGRect(x:0,y:0,width: self.view.bounds.width,height: self.view.bounds.height))
        tableView.delegate=self
        tableView.dataSource=self
        self.view.addSubview(tableView)
        
    }
    //分区个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //设置每个分区的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    //单元格加载
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //单元格初始化
        //从表格视图加载可重用的单元格
        let cellId="cell" //单元格的样式Id
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil{
            cell=UITableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: cellId)
        }
        let strInfo=dataArr[indexPath.row] as! String
        cell?.textLabel?.text=strInfo+" 分区\(indexPath.section)"
        return cell!
    }
    //设置单元格的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    //单元格的选中
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("选中单元格 分区：\(indexPath.section) 行：\(indexPath.row)")
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
