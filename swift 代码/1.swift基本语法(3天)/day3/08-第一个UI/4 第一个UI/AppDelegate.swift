//
//  AppDelegate.swift
//  4 第一个UI
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//
//把AppDelegate当做整个程序的入口
//图片 矢量图： 放大 不会出现模糊
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?//UIWindow 已自动初始化过一次，所以不需要在 didFinishLaunchingWithOptions 初始化，除非调用指定的视图控制器或者其他控制器操作的时候，要对UIWindow做一次初始化


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //1.创建一个UIwindow对象 并初始化
        self.window=UIWindow(frame:UIScreen.mainScreen().bounds)
        //2.用纯代码的方式创建视图控制器
        let firstVC=FirstViewController()
        //3.给uiwindow对象的根视图控制器赋值
        self.window?.rootViewController=firstVC
        //4.设置UIwindow对象为可见
        self.window?.makeKeyWindow()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

