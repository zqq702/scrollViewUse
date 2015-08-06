//
//  ViewController.m
//  UITableViewUse
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置数据源
    self.tableView.dataSource = self;
    
}
#pragma mark 数据源方法

//一共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//相应地组对应多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 4;
    }
}


//设置每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"奥迪";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"宝马";
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"奔驰";
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"奥迪";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"宝马";
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"奔驰";
        }else if(indexPath.row == 3){
            cell.textLabel.text = @"本田";
        }
    }
    return cell;
}


//分组头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *str = [NSString new];
    if(section == 0){
        str = @"第一组";
    }else if(section == 1){
        str = @"第二组";
    }
    return str;
}
//分组尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *str = [NSString new];
    if(section == 0){
        str = @"第一组三个";
    }else if(section == 1){
        str = @"第二组四个";
    }
    return str;
}

@end
