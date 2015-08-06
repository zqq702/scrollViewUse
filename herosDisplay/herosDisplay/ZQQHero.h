//
//  ZQQHero.h
//  herosDisplay
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQQHero : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)hreoWithDict:(NSDictionary *)dict;
@end
