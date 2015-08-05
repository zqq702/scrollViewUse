//
//  ViewController.m
//  enlargeImage
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //可以滚动
    self.scrollView.scrollEnabled = YES;
    //可以弹动
    self.scrollView.bounces = YES;
    //滚动范围
    self.scrollView.contentSize = self.imageView.frame.size;
    //开始位置
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//开始拖拽(开始时调用一次)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始拖拽");
}
//滚动就调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"正在滚动");
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"开始缩放");
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2){
    NSLog(@"正在缩放");
}
@end
