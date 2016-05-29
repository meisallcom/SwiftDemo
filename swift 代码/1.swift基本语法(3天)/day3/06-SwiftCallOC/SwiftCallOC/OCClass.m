//
//  OCClass.m
//  SwiftCallOC
//
//  Created by lujing on 16/5/12.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "OCClass.h"
#import "SwiftModule-swift.h"
@implementation OCClass
- (NSString *)description
{
    return @"我是OC编写的类";
}
- (void)createSwiftInstance
{
    SwiftClass *sc = [[SwiftClass alloc] init];
    NSLog(@">>>>>%@",sc);
}
@end
