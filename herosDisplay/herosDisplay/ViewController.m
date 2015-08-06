//
//  ViewController.m
//  herosDisplay
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ViewController.h"
#import "ZQQHero.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.rowHeight = 60;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //[self heros];

}
/**
 *  隐藏状态栏
 */
- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark -- 懒加载
- (NSArray *)heros{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        //遍历
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dict in tempArray) {

            //字典转模型
            ZQQHero *hero = [ZQQHero hreoWithDict:dict];
            [mArray addObject:hero];
        }
        _heros = mArray.copy;
    }
    //NSLog(@"%@",_heros);
    return _heros;
}
#pragma mark -- 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    //取出模型
    ZQQHero *hero = self.heros[indexPath.row];
    cell.detailTextLabel.text = hero.intro;
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    return cell;
}
#pragma mark -- 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
