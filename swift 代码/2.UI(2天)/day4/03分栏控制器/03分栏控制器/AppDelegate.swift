//
//  AppDelegate.swift
//  03分栏控制器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //分栏控制器
        //创建3个视图控制器
        let fVC=FirstViewController()
        let sVC=SecondViewController()
        let tVC=ThirdViewController()
        
        //创建导航控制器
        let nav1=UINavigationController(rootViewController:fVC)
        let nav2=UINavigationController(rootViewController:sVC)
        let nav3=UINavigationController(rootViewController:tVC)
        //创建分栏控制器的对象
        let tabBar=UITabBarController()
        nav1.tabBarItem=UITabBarItem(title:"视图1",image:nil,tag: 1)
        nav2.tabBarItem=UITabBarItem(title:"视图2",image:nil,tag:2)
            nav3.tabBarItem=UITabBarItem(title: "视图3",image: nil,tag: 3)
        
        tabBar.viewControllers=[nav1,nav2,nav3]
        tabBar.delegate=self
        //将分栏控制器加载到根视图控制器
        self.window?.rootViewController=tabBar
        return true
    }
    //选中分栏控制器的选项卡
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print("分栏控制器 选择:(\(tabBarController.selectedIndex))")
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

