//
//  ZQQQueation.m
//  guessImage
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQQueation.h"

@implementation ZQQQueation
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)questionsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
