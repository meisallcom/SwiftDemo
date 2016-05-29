//
//  ViewController.swift
//  swiftSocket
//
//  Created by 青云 on 16/5/21.
//  Copyright © 2016年 青云. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
class ViewController: UIViewController,GCDAsyncSocketDelegate {
    var syncSocket:GCDAsyncSocket!=nil
    
    @IBOutlet weak var ipTf:UITextField!
    @IBOutlet weak var portTf:UITextField!
    @IBOutlet weak var contentTf:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectBtn(sender:AnyObject){
        let strIp=ipTf.text
        let strPort=portTf.text
        
        let nPort=UInt16(strPort!)
        //建立连接
        syncSocket=GCDAsyncSocket(delegate: self,delegateQueue: dispatch_get_main_queue())
        do {
            try syncSocket.connectToHost(strIp, onPort: nPort!)
        }catch let error as NSError{
            print("连接出现错误 \(error)")
        }
        
        
    }
    //发送数据
    @IBAction func sendBtn(sender:AnyObject){
        let dData:NSData=contentTf.text!.dataUsingEncoding(NSUTF8StringEncoding)!
        syncSocket.writeData(dData, withTimeout: -1, tag: 1)
    }
    //连接到主机响应的方法
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("连接主机成功")
    }
    //向服务器发送数据，成功响应的方法
    func socket(sock: GCDAsyncSocket!, didWriteDataWithTag tag: Int) {
        print("向服务器发送数据成功\(tag)")
    }
    //读取从服务器发来的数据
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
        print("读取从服务器发来的数据")
    }
    
    
}

