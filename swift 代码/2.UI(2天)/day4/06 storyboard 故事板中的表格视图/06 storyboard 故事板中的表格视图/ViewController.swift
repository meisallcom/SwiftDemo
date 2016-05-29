//
//  ViewController.swift
//  06 storyboard 故事板中的表格视图
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class ViewController:
UIViewController,UITableViewDelegate,UITableViewDataSource{
   //weak弱引用  strong 强引用
    @IBOutlet weak var tableView:UITableView!
    var dataArr=NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate=self
        tableView.dataSource=self
        
        for i in 0..<10 {
            dataArr.addObject("第\(i)行")
        }
        
    }
    //设置分区个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //不同的单元格样式
        //单元格初始化
        let cellId:String!
        if (indexPath.row+1)%2==0{
            cellId="cell"
        }else{
            cellId="cell1"
        }
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil {
            cell=UITableViewCell(style: .Default,reuseIdentifier: cellId)
        }
        
        let strInfo=dataArr[indexPath.row] as! String
        //强制转换自定义单元格
        if(indexPath.row+1)%2==0{
            let cell1=cell as! customCell
            cell1 .updateCell(strInfo)
            return cell1
        }else{
            let cell1=cell as! customCell1
            cell1 .updateCell(strInfo)
            return cell1
        }
       
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

