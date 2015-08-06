//
//  ZQQApp.h
//  appDownloadManage
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQQApp : NSObject
//icon  name
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
