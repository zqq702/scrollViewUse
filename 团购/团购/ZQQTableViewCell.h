//
//  ZQQTableViewCell.h
//  团购
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZQQTg;
@interface ZQQTableViewCell : UITableViewCell
@property (nonatomic, strong) ZQQTg *tg;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
