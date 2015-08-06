//
//  ZQQAppView.h
//  appDownloadManage
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZQQApp,ZQQAppView;


@protocol ZQQAppViewDeleget <NSObject>

-(void)downloadBtnClick:(UIButton *)downloadBtn;

@end

@interface ZQQAppView : UIView
@property (nonatomic, weak) id<ZQQAppViewDeleget> deleget;
@property (nonatomic, strong) ZQQApp *app;

+ (instancetype)appViewWithDict:(ZQQApp *)app;
@end
