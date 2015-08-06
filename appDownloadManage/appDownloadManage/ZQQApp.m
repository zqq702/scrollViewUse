//
//  ZQQApp.m
//  appDownloadManage
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQApp.h"

@implementation ZQQApp
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
