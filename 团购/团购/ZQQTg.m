//
//  ZQQTg.m
//  团购
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQTg.h"

@implementation ZQQTg
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)tgWithDict:(NSDictionary *)dict{
    return [[super alloc]initWithDict:dict];
}
@end
