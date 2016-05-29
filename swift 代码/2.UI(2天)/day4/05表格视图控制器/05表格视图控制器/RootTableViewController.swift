//
//  RootTableViewController.swift
//  05表格视图控制器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    var _dataArr=NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        for i in 0..<10{
            _dataArr.addObject("第\(i)行")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _dataArr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      

        // Configure the cell...
        //单元格初始化
        let cellId="cell"
        //重用单元格
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId)
        if(cell==nil){
            cell=UITableViewCell(style: .Default,reuseIdentifier: cellId)
        }
        //给单元格设置文本
        let strInfo=_dataArr[indexPath.row] as! String;
    
        cell?.textLabel?.text=strInfo+String(" 分区\(indexPath.section)")
        cell?.backgroundColor=UIColor.orangeColor()
        //强制转换 类型
        return cell!
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("indexPath=\(indexPath.row)")
        
        let strInfo="选中\(indexPath.section) \(indexPath.row)"
        self.alertView(strInfo)
        
    }
    func alertView(strInfo:String){
        
        
        //对话框
        let alert=UIAlertController(title: "标题",message: strInfo,preferredStyle: UIAlertControllerStyle.Alert)
        //ios 8.0以前的版本支持
        //UIAlertView
        alert.addAction(UIAlertAction(title:"取消",style: UIAlertActionStyle.Default,handler:{
            (UIAlertAction) in
            print("取消")
        }))
        alert.addAction(UIAlertAction(title:"确定",style: UIAlertActionStyle.Default,handler:{
            (UIAlertAction) in
            print("确定")
        }))
        //弹出一个视图控制器
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
