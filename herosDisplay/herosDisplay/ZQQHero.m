//
//  ZQQHero.m
//  herosDisplay
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQHero.h"

@implementation ZQQHero
+ (instancetype)hreoWithDict:(NSDictionary *)dict{
    return [[super alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
