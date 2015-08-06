//
//  ViewController.m
//  团购
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#import "ZQQTableViewCell.h"
#import "ZQQTg.h"

@interface ViewController ()<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tgs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    self.tableView.dataSource = self;
    //[self tgs];
}
//隐藏导航栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- 懒加载
- (NSArray *)tgs{
    if (_tgs == nil) {
        //加载plist的数据
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        //临时数组存储数据
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        //可变数组存放遍历的字典
        NSMutableArray *mArray = [NSMutableArray array];
        //遍历
        for (NSDictionary *dict in tempArray) {
            //字典转模型
            ZQQTg *tg = [ZQQTg tgWithDict:dict];
            [mArray addObject:tg];
        }
        _tgs = mArray.copy;
    }
    //NSLog(@"%@",_tgs);
    return _tgs;
}
#pragma mark -- 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    ZQQTableViewCell *cell = [ZQQTableViewCell cellWithTableView:tableView];
    //赋值
    cell.tg = self.tgs[indexPath.row];
    //return
    return cell;
}
@end
