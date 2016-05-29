//
//  QYCreditCard.swift
//  06-ARC
//
//  Created by lujing on 16/5/10.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

import Cocoa

class QYCreditCard: NSObject {
    let number: UInt64
    unowned let customer: QYCustomer
    //let customer: QYCustomer
    init(number: UInt64, customer: QYCustomer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) bye ...") }
}
