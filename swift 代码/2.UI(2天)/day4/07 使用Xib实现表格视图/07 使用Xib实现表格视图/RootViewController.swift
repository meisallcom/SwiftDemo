//
//  RootViewController.swift
//  07 使用Xib实现表格视图
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView:UITableView!
    var dataArr=NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate=self
        tableView.dataSource=self
        for i in 0..<10{
            dataArr.addObject("第\(i)行")
        }
    }

    //设置分区个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //每个分区的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //单元格初始化
        let cellId="cell"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil {
            cell=UITableViewCell(style: .Default,reuseIdentifier: cellId)
        }
        let strInfo=dataArr[indexPath.row] as! String;
        cell?.textLabel?.text=String(indexPath.section)+"分区 \(strInfo)"
        
        return cell!
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
