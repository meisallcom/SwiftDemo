//
//  DistrictSearchDemoViewController.swift
//  BMKSwiftDemo
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 baidu. All rights reserved.
//

import Foundation

class DistrictSearchDemoViewController: UIViewController, BMKMapViewDelegate, BMKDistrictSearchDelegate  {
    
    @IBOutlet weak var _mapView: BMKMapView!
    
    var districtSearch: BMKDistrictSearch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化搜索服务
        districtSearch = BMKDistrictSearch()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        _mapView.viewWillAppear()
        _mapView.delegate = self
        districtSearch.delegate = self
        requestDistrictSearch()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView.viewWillDisappear()
        _mapView.delegate = nil
        districtSearch.delegate = nil
    }
    
    //发起请求
    func requestDistrictSearch() {
        let option = BMKDistrictSearchOption()
        option.city = "北京"
        option.district = "海淀"
        let flag = districtSearch.districtSearch(option)
        if flag {
            print("district检索发送成功")
        } else {
            print("district检索发送失败")
        }
    }

    // MARK: - BMKDistrictSearchDelegate
    /**
    *返回行政区域搜索结果
    *@param searcher 搜索对象
    *@param result 搜索结BMKDistrictSearch果
    *@param error 错误号，@see BMKSearchErrorCode
    */
    func onGetDistrictResult(searcher: BMKDistrictSearch!, result: BMKDistrictResult!, errorCode error: BMKSearchErrorCode) {
        print("onGetDistrictResult error: \(error)")
        if error == BMK_SEARCH_NO_ERROR {
            print("\nname:\(result.name)\ncode:\(result.code)\ncenter latlon:\(result.center.latitude),\(result.center.longitude)");
            
            // 通过points构建BMKPolygon
            let polygon = BMKPolygon(points: result.points, count: UInt(result.pointsCount))
            _mapView.addOverlay(polygon) // 添加overlay
            mapViewFitPolygon(polygon)
        }
    }

    // MARK: - BMKMapViewDelegate
    /**
    *根据overlay生成对应的View
    *@param mapView 地图View
    *@param overlay 指定的overlay
    *@return 生成的覆盖物View
    */
    func mapView(mapView: BMKMapView!, viewForOverlay overlay: BMKOverlay!) -> BMKOverlayView! {
        if (overlay as? BMKPolygon) != nil {
            let polygonView = BMKPolygonView(overlay: overlay)
            polygonView.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.6)
            polygonView.fillColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.4)
            polygonView.lineWidth = 1
            polygonView.lineDash = true
            return polygonView
        }
        return nil
    }
    
    
    // MARK: -
    //根据polygon设置地图范围
    func mapViewFitPolygon(polygon: BMKPolygon!) {
        if polygon.pointCount < 1 {
            return
        }
        
        let pt = polygon.points[0]
        var ltX = pt.x
        var rbX = pt.x
        var ltY = pt.y
        var rbY = pt.y
        
        for i in 1..<polygon.pointCount {
            let pt = polygon.points[Int(i)]
            if pt.x < ltX {
                ltX = pt.x
            }
            if pt.x > rbX {
                rbX = pt.x
            }
            if pt.y > ltY {
                ltY = pt.y
            }
            if pt.y < rbY {
                rbY = pt.y
            }
        }
        
        let rect = BMKMapRectMake(ltX, ltY, rbX - ltX, rbY - ltY)
        _mapView.visibleMapRect = rect
        _mapView.zoomLevel = _mapView.zoomLevel - 0.3
    }
}