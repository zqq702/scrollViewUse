//
//  ZQQAppView.m
//  appDownloadManage
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQAppView.h"
#import "ZQQApp.h"
@interface ZQQAppView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation ZQQAppView
- (IBAction)downloadBtnClick:(id)sender {
    //让按钮失效
    [sender isEnabled];
    //显示下载成功的信息  UILable
    //UILable 的frame
    //添加
    //动画[UIImage anima^]
}

+ (instancetype)appViewWithDict:(ZQQApp *)app{
    //加载xib
    //NSString *bundle = [NSBundle mainBundle];
    NSArray *appArray = [[NSBundle mainBundle] loadNibNamed:@"ZQQAppView" owner:nil options:nil];
    ZQQAppView *appView = [appArray lastObject];
    appView.app = app;
    return appView;
}
- (void)setApp:(ZQQApp *)app{
    _app = app;
    self.iconView.image = [UIImage imageNamed:app.icon];
    self.nameView.text = app.name;
}
@end
