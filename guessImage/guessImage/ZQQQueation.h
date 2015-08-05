//
//  ZQQQueation.h
//  guessImage
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQQQueation : NSObject
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *options;

//传入字典参数的构造方法
- (instancetype)initWithDict:(NSDictionary *)Dict;
+ (instancetype)questionsWithDict:(NSDictionary *)Dict;
@end
