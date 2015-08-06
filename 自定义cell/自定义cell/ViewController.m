//
//  ViewController.m
//  自定义cell
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#import "ZQQContent.h"
@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;

}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

//懒加载
- (NSArray *)array{
    if (_array == nil) {
        ZQQContent *content1 = [ZQQContent new];
        content1.headTitle = @"优秀";
        content1.message = @[@"张义",@"张相",@"李艳",@"杨明",@"孟浩浩"];
        content1.rootTitle = @"值得表扬";

        ZQQContent *content2 = [ZQQContent new];
        content2.headTitle = @"及格";
        content2.message = @[@"张义",@"张相",@"李艳",@"杨明",@"孟浩浩",@"李笑笑",@"王翔",@"王年书",@"刘恒",@"刘谦",@"郑晓春",@"邓楠"];
        content2.rootTitle = @"再接再厉";

        ZQQContent *content3 = [ZQQContent new];
        content3.headTitle = @"不及格";
        content3.message = @[@"张良"];
        content3.rootTitle = @"要好好努力了#";
        _array = @[content1,content2,content3];
    }
    return _array;
}
#pragma mark -- 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出模型
    ZQQContent *content = self.array[section];
    return content.message.count;
}
//每行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //取出第indexPath.section 对应的模型
    ZQQContent *content = self.array[indexPath.section];
    //取出第indexPath行对应的数据
    NSString *str = content.message[indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //取出第section组对应的模型
    ZQQContent *content = self.array[section];
    return content.headTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    ZQQContent *content = self.array[section];
    return content.rootTitle;

}
@end
