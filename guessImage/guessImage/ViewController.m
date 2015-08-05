//
//  ViewController.m
//  guessImage
//
//  Created by 张庆庆 on 15/8/5.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#import "ZQQQueation.h"
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
    //默认是0
    self.index = -1;
    [self nextQuestionBtnClick:nil];
}


//懒加载  （字典转模型）
- (NSArray *)questions{
    //先判断
    if (!_questions) {
        //加载plist
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist"ofType:nil]];
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray new];
        for (NSDictionary *dict in array) {
            ZQQQueation *question = [ZQQQueation questionsWithDict:dict];
            [mArray addObject:question];
        }
        _questions = mArray.copy;
    }
    return _questions;
}


//设置控制器状态栏
- (UIStatusBarStyle)preferredStatusBarStyle{
    //白色
    return UIStatusBarStyleLightContent;

}


//设置控件的数据
- (void)settingData:(ZQQQueation *)question{
    //设置序号
    self.numLabel.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.index+1,(unsigned long)self.questions.count];
    //设置标题
    self.titleLabel.text = question.title;
    //设置中间按钮图片
    [self.centerImgBtn setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    //设置下一按钮的状态
    if(self.index == self.questions.count - 1){
        self.nextQuestionBtn.enabled = NO;
    }
}

- (IBAction)tipBtnClick:(id)sender {
}
- (IBAction)helpBtnClick:(id)sender {
}


//图片放大缩小
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


//点击下一题
- (IBAction)nextQuestionBtnClick:(id)sender {
    //最后一题
    if (self.index == self.questions.count -1) {
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"恭喜答题成功" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"其他", nil];
        [sheet showInView:self.view];
        return;
    }
    self.index ++;
    //取出模型
    ZQQQueation *question = self.questions[self.index];
    //设置控件数据
    [self settingData:question];
    //添加正确答案按钮
    [self addAnswerBtn:question];
    //添加带选项按钮
    [self addOptionBtn:question];
}


//添加正确答案按钮
- (void)addAnswerBtn:(ZQQQueation *)question{
    //删除之前的所有按钮
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //添加新的答案按钮
    NSInteger length = question.answer.length;
    for (int i = 0; i < length; i++) {
        //创建按钮
        UIButton *answerBtn = [[UIButton alloc]init];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置背景
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        //设置frame  x,y,w,h
        CGFloat margin = 5;
        CGFloat viewW = self.answerView.frame.size.height;
        CGFloat w = viewW - margin*2;
        CGFloat h = w;
        CGFloat y = 0;
        CGFloat x = (self.answerView.frame.size.width - length*w-(length-1)*margin)*0.5 + i*(margin+w);
        answerBtn.frame = CGRectMake(x, y, w, h);
        [self.answerView addSubview:answerBtn];

        //监听点击
        [answerBtn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//监听按钮点击
- (void)answerClick:(UIButton *)answerBtn{
}


//添加带选项按钮
- (void)addOptionBtn:(ZQQQueation *)question{
    //删除之前的所有按钮
    [self.optionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //添加新的按钮
    NSInteger count = question.options.count;
    for (int i = 0; i<count; i++) {
        UIButton *optionBtn = [[UIButton alloc]init];
        //设置背景
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        //设置内容
        [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置frame  3行 7列
        //w.  (self.optionView.frame.size.w -8*magin)/7;
        //h = w
        //i/7hang row i%7col
        //x = col*margin+(col-1)*w
        //y = row*margin+(row-1)*h;
        int row = i/7;
        int col = i%7;
        CGFloat margin = 5;
        CGFloat w = (self.optionView.frame.size.width - 8*margin)/7;
        CGFloat h = w;
        CGFloat x = (col+1) * margin + col * w;
        CGFloat y = (row+1) * margin + row * h;
        optionBtn.frame = CGRectMake(x, y, w, h);
        //添加
        [self.optionView addSubview:optionBtn];
        //监听点击
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//监听待选按钮点击
- (void)optionClick:(UIButton *)optionBtn{
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
