//
//  ViewController.m
//  scrollViewUsese
//
//  Created by 张庆庆 on 15/8/4.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
/**
 *  @property(nonatomic)         CGPoint                      contentOffset;                  // default CGPointZero
 @property(nonatomic)         CGSize                       contentSize;                    // default CGSizeZero
 @property(nonatomic)         UIEdgeInsets                 contentInset;                   // default UIEdgeInsetsZero. add additional scroll area around content

 */
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *srrollView;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.srrollView.scrollEnabled = YES;
    self.srrollView.bounces = YES;
    CGFloat H = self.bottomBtn.frame.origin.y + 100;
    //滚动范围
    self.srrollView.contentSize = CGSizeMake(0, H);
    //一开始的滚动位置
    self.srrollView.contentOffset = CGPointMake(0, -64);
    //设置额外的位置
    self.srrollView.contentInset = UIEdgeInsetsMake(64, 0, 64, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
