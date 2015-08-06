//
//  ViewController.m
//  scrollViewPageControll
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#define imgCount 5

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
//定时器
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //固定尺寸
    CGFloat imgW = self.scrollView.frame.size.width;
    CGFloat imgH = self.scrollView.frame.size.width;
    CGFloat imgY = 0;
    //添加图片
    for (int i = 0; i < imgCount; i++) {
        UIImageView *imgView = [UIImageView new];
        imgView.frame = CGRectMake(i*imgW, imgY, imgW, imgH);
        NSString *imgName = [NSString stringWithFormat:@"img_0%d",i+1];
        imgView.image = [UIImage imageNamed:imgName];
        [self.scrollView addSubview:imgView];
    }
    //设置scrollView滚动范围
    self.scrollView.contentSize = CGSizeMake(imgW*imgCount, 0);
    //隐藏水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //分页
    self.scrollView.pagingEnabled = YES;
    //设置pageControl的总页数



    //添加定时器
    [self addTimer];
    self.scrollView.delegate = self;
}
//添加定时器
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];//repeats 重复
    //定时事件加入程序运行循环  可实现暂停启用的功能
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
//移除定时器
- (void)removeTimer{
    [self.timer invalidate];//invalidate使无效
    self.timer = nil;
}
- (void)nextImage{
    //增加pageContrl的页面
    NSInteger page = 0;
    if (self.pageControl.currentPage == imgCount - 1) {
        page = 0;
    }else{
        page = self.pageControl.currentPage + 1;
    }
    //计算scrollView的位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
#pragma mark - 代理方法
/**
 *  scrllView正在滚动时调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //根据scrollView的滚动线上pageControl第几页
    CGFloat W = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + W*0.5)/W;
    self.pageControl.currentPage = page;

}
/**
 *  开始拖拽时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self removeTimer];
}
/**
 *  停止拖拽时调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //开启定时器
    [self addTimer];
}
@end
