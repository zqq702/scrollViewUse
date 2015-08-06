//
//  ZQQTableViewCell.m
//  团购
//
//  Created by 张庆庆 on 15/8/6.
//  Copyright (c) 2015年 Zqq. All rights reserved.
//

#import "ZQQTableViewCell.h"
#import "ZQQTg.h"
@interface ZQQTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLable;

@end
@implementation ZQQTableViewCell

- (void)setTg:(ZQQTg *)tg{
    self.iconView.image = [UIImage imageNamed:tg.icon];
    self.titleLable.text = tg.title;
    self.priceLable.text = [NSString stringWithFormat:@"￥%@", tg.price];
    self.buyCountLable.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    NSString *ID = @"tg";
    ZQQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZQQTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
