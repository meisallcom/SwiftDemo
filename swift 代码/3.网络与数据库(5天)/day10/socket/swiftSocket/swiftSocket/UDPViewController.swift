//
//  UDPViewController.swift
//  swiftSocket
//
//  Created by 青云 on 16/5/21.
//  Copyright © 2016年 青云. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class UDPViewController: UIViewController,GCDAsyncUdpSocketDelegate {
      var syncSocket:GCDAsyncUdpSocket!=nil
    @IBOutlet weak var ipTf:UITextField!
    @IBOutlet weak var portTf:UITextField!
    @IBOutlet weak var contentTf:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func connectBtn(sender:AnyObject){
        let strIp=ipTf.text!
        let strPort=portTf.text!
        print("strIp:\(strIp) port:\(strPort)")
        let nPort=UInt16(strPort)
        //建立连接
        syncSocket=GCDAsyncUdpSocket(delegate: self,delegateQueue: dispatch_get_main_queue())
        do {
            try syncSocket.bindToPort(nPort!)
            try syncSocket.beginReceiving()
            try syncSocket.connectToHost(strIp, onPort: nPort!)
        }catch let error as NSError{
            print("连接出现错误 \(error)")
        }
        
        
    }
    //发送数据
    @IBAction func sendBtn(sender:AnyObject){
        let dData:NSData=contentTf.text!.dataUsingEncoding(NSUTF8StringEncoding)!
        print("发送数据 \(contentTf.text!)")
        syncSocket.sendData(dData, withTimeout: -1, tag: 1)
    }

    func udpSocket(sock: GCDAsyncUdpSocket!, didNotConnect error: NSError!) {
        print("不再连接主机")
    }
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotSendDataWithTag tag: Int, dueToError error: NSError!) {
        print("发送失败\(error.description)")
    }
    func udpSocket(sock: GCDAsyncUdpSocket!, didConnectToAddress address: NSData!) {
        print("连接udp主机")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didSendDataWithTag tag: Int) {
        print("向服务器发送udp数据")
    }
    //向服务器发送数据，成功响应的方法
    func socket(sock: GCDAsyncUdpSocket!, didWriteDataWithTag tag: Int) {
        print("向服务器发送数据成功\(tag)")
    }
    //读取从服务器发来的数据
    func socket(sock: GCDAsyncUdpSocket!, didReadData data: NSData!, withTag tag: Int) {
        print("读取从服务器发来的数据")
    }
  
}
