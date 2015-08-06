//
//  ViewController.m
//  appDownloadManage
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#import "ZQQApp.h"
#import "ZQQAppView.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //显示九宫格 3 4
    //NSLog(@"%lu",(unsigned long)self.apps.count);//12
    //w = 100;  h = 100 ;margin = (self.view.frame.size.width - 3*100)/4;  row列      rol行
    //rol = i/3(hang)0123  row i%3  lie012
    //x = row*(margin+w)+margin y =rol*(margin+w)+margin
    CGFloat w = 100;
    CGFloat h = w;
    NSUInteger count = self.apps.count;
    int rowNum = 3;

    CGFloat margin = (self.view.frame.size.width - rowNum*w)/(rowNum+1);
    for (int i = 0; i < count; i++) {
        ZQQAppView *view = [ZQQAppView appViewWithDict:self.apps[i]];
        //view.backgroundColor = [UIColor redColor];
        int row = i%rowNum;
        int rol = i/rowNum;
        CGFloat x = row * (margin + w) + margin;
        CGFloat y = rol * (margin + h) + 3*margin;
        view.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:view];
    }


}

//懒加载
- (NSArray *)apps{
    if (_apps == nil) {
        //1.获取plist路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        //临时数组存放app.plist中的数据
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *appArray = [NSMutableArray array];
        //遍历
        for (NSDictionary *appDict in tempArray) {
            //字典转模型
            ZQQApp *app = [ZQQApp appWithDict:appDict];
            [appArray addObject:app];
        }
        _apps = appArray.copy;
    }
    return _apps;
}

@end
