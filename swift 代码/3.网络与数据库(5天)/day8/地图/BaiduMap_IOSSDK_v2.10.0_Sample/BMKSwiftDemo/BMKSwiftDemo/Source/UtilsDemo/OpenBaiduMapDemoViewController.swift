//
//  OpenBaiduMapDemoViewController.swift
//  BMKSwiftDemo
//
//  Created by wzy on 15/11/9.
//  Copyright © 2015年 baidu. All rights reserved.
//

import UIKit

class OpenBaiduMapDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titleArray = ["启动百度地图导航",
        "启动百度地图POI周边检索",
        "启动百度地图POI详情页面",
        "启动百度地图步行路线规划",
        "启动百度地图驾车路线规划",
        "启动百度地图公交路线规划",
        "启动百度地图步行导航",
        "启动百度地图骑行导航"]
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RootTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            openMapNativeNavi()
        case 1:
            openMapPoiNearby()
        case 2:
            openMapPoiDetail()
        case 3:
            openMapWalkingRoute()
        case 4:
            openMapDrivingRoute()
        case 5:
            openMapTransitRoute()
        case 6:
            openMapNativeWalkOrRideNavi(true)
        case 7:
            openMapNativeWalkOrRideNavi(false)
        default:
            break
        }
    }
    
    // MARK: - 
    
    // 调启百度地图 APP 导航
    func openMapNativeNavi() {
        // 初始化调启导航的参数管理类
        let parameter = BMKNaviPara()
        // 指定导航类型
//        parameter.naviType = BMK_NAVI_TYPE_NATIVE
        
        // 初始化终点节点
        let end = BMKPlanNode()
        // 指定终点经纬度
        let coordinate = CLLocationCoordinate2DMake(39.915, 116.404)
        end.pt = coordinate
        // 指定终点名称
        end.name = "天安门"
        // 指定终点
        parameter.endPoint = end
        
        // 指定返回自定义 scheme
        parameter.appScheme = "baidumapsdk://mapsdk.baidu.com"
        
        // 调启百度地图客户端导航
        BMKNavigation.openBaiduMapNavigation(parameter)
    }

    //打开地图 poi周边
    func openMapPoiNearby() {
        let opt = BMKOpenPoiNearbyOption()
        opt.appScheme = "baidumapsdk://mapsdk.baidu.com"
        opt.keyword = "美食";
        opt.location = CLLocationCoordinate2DMake(39.915,116.360582)
        opt.radius = 1000
        let code = BMKOpenPoi.openBaiduMapPoiNearbySearch(opt)
        print("\(code)");    }
    
    //打开地图 poi详情
    func openMapPoiDetail() {
        let opt = BMKOpenPoiDetailOption()
        opt.appScheme = "baidumapsdk://mapsdk.baidu.com"
        opt.poiUid = "d3099bdd81c525dbd1f49ee6"//天安门
        let code = BMKOpenPoi.openBaiduMapPoiDetailPage(opt)
        print("\(code)");
    }
    
    //打开地图 步行路线检索
    func openMapWalkingRoute() {
        let opt = BMKOpenWalkingRouteOption()
        opt.appScheme = "baidumapsdk://mapsdk.baidu.com"
        
        //初始化起点节点
        let start = BMKPlanNode()
        //指定起点经纬度
        start.pt = CLLocationCoordinate2DMake(39.90868, 116.204)
        //指定起点名称
        start.name = "西直门"
        //指定起点
        opt.startPoint = start
        
        //初始化终点节点
        let end = BMKPlanNode()
        //指定终点经纬度
        end.pt = CLLocationCoordinate2DMake(39.90868, 116.3956)
        //指定终点名称
        end.name = "天安门"
        //指定终点
        opt.endPoint = end
        
        let code = BMKOpenRoute.openBaiduMapWalkingRoute(opt)
        print("\(code)");
    }
    
    //打开地图 驾车路线检索
    func openMapDrivingRoute() {
        let opt = BMKOpenDrivingRouteOption()
        opt.appScheme = "baidumapsdk://mapsdk.baidu.com"
        
        //初始化起点节点
        let start = BMKPlanNode()
        //指定起点经纬度
        start.pt = CLLocationCoordinate2DMake(39.90868, 116.204)
        //指定起点名称
        start.name = "西直门"
        //指定起点
        opt.startPoint = start
        
        //初始化终点节点
        let end = BMKPlanNode()
        //指定终点经纬度
        end.pt = CLLocationCoordinate2DMake(39.90868, 116.3956)
        //指定终点名称
        end.name = "天安门"
        //指定终点
        opt.endPoint = end
        
        let code = BMKOpenRoute.openBaiduMapDrivingRoute(opt)
        print("\(code)");
    }
    
    //打开地图 公交路线检索
    func openMapTransitRoute() {
        let opt = BMKOpenTransitRouteOption()
        opt.appScheme = "baidumapsdk://mapsdk.baidu.com"
        
        //初始化起点节点
        let start = BMKPlanNode()
        //指定起点经纬度
        start.pt = CLLocationCoordinate2DMake(39.90868, 116.204)
        //指定起点名称
        start.name = "西直门"
        //指定起点
        opt.startPoint = start
        
        //初始化终点节点
        let end = BMKPlanNode()
        //指定终点经纬度
        end.pt = CLLocationCoordinate2DMake(39.90868, 116.3956)
        //指定终点名称
        end.name = "天安门"
        //指定终点
        opt.endPoint = end
        
        opt.openTransitPolicy = BMK_OPEN_TRANSIT_RECOMMAND
        
        let code = BMKOpenRoute.openBaiduMapTransitRoute(opt)
        print("\(code)");
    }
    
    // 调启百度地图 APP 骑行、步行导航
    func openMapNativeWalkOrRideNavi(walk: Bool) {
        // 初始化调启导航的参数管理类
        let parameter = BMKNaviPara()
        
        // 初始化终点节点
        let end = BMKPlanNode()
        // 指定终点经纬度
        let coordinate = CLLocationCoordinate2DMake(39.915, 116.404)
        end.pt = coordinate
        // 指定终点名称
        end.name = "天安门"
        // 指定终点
        parameter.endPoint = end
        
        // 指定返回自定义 scheme
        parameter.appScheme = "baidumapsdk://mapsdk.baidu.com"
        
        // 调启百度地图客户端骑行、步行导航
        if walk {
            BMKNavigation.openBaiduMapWalkNavigation(parameter)
        } else {
            BMKNavigation.openBaiduMapRideNavigation(parameter)
        }
    }
}

