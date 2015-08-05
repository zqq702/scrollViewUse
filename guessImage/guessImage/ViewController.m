//
//  ViewController.m
//  guessImage
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *centerImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionBtn;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;
//当前题目序号
@property (nonatomic, assign) NSInteger index;
//遮盖View
@property (nonatomic, weak) UIButton *coverView;
//所有题目的数组
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, assign) CGRect frame;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tipBtnClick:(id)sender {
}
- (IBAction)helpBtnClick:(id)sender {
}


- (IBAction)bigImgBtnclick {
    self.frame = self.centerImgBtn.frame;
    UIButton *coverView = [[UIButton alloc]init];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.0;
    coverView.frame = self.view.bounds;
    [coverView addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coverView];
    self.coverView = coverView;
    //图片在遮盖物上面
    [self.view bringSubviewToFront:self.centerImgBtn];
    //执行动画
    [UIView animateWithDuration:2 animations:^{
        //
        self.coverView.alpha = 0.7;
        CGFloat x = 0;
        CGFloat y = (self.view.frame.size.height - self.view.frame.size.width)/2;
        CGFloat w = self.view.frame.size.width;
        CGFloat h = w;
        self.centerImgBtn.frame = CGRectMake(x, y, w, h);
    }];

}
- (void)smallImage{
    [UIView animateWithDuration:2.0 animations:^{
        self.centerImgBtn.frame = self.frame;
        self.coverView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        self.coverView = nil;
    }];
}


- (IBAction)nextQuestionBtnClick:(id)sender {
}

//点击中间图片  实现放大缩小
- (IBAction)centerImgBtnClick:(id)sender {
    if(self.coverView == nil){
        [self bigImgBtnclick];
    }else{
        [self smallImage];
    }
}

@end
