//
//  TableViewCell.m
//  myproject
//
//  Created by 何明礼 on 2018/2/18.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



// 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
      
        
        self.cellImage = [UIImageView new];
        self.cellImage.image = [UIImage imageNamed:@"t1"];
        [self addSubview:self.cellImage];
        [self.cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(343);
        }];
        
        self.cellTag = [UIImageView new];
        [self addSubview:self.cellTag];
        self.cellTag.layer.borderColor = [[UIColor colorWithRed:248/255. green:49/255. blue:48/255. alpha:1.0] CGColor];
        self.cellTag.layer.borderWidth = 1;
        self.cellTag.layer.cornerRadius = 2;
        [self.cellTag mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellImage.mas_bottom).offset(10);
            make.left.mas_equalTo(self.cellImage.mas_left);
            make.size.mas_equalTo(CGSizeMake(50,15));
        }];
        
        self.cellType = [UILabel new];
        [self.cellTag addSubview:self.cellType];
        self.cellType.text = @"婚纱摄影";
        self.cellType.font = [UIFont boldSystemFontOfSize:11.0];
        self.cellType.textColor =  [UIColor colorWithRed:248/255. green:49/255. blue:48/255. alpha:1.0];
        [self.cellType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
        
        self.cellTitle = [UILabel new];
        [self addSubview:self.cellTitle];
        self.cellTitle.textColor = [UIColor blackColor];
        self.cellTitle.text = @"旅拍必拍景点套餐，鼓浪屿/厦大/环岛类似的九分裤";
        self.cellTitle.font = [UIFont boldSystemFontOfSize:16.0];
        [self.cellTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellImage.mas_bottom).offset(8);
            make.left.mas_equalTo(self.cellTag.mas_right).offset(10);
            make.width.mas_equalTo(self.cellImage.mas_width).multipliedBy(0.8);
        }];
        
        self.cellText = [UILabel new];
        [self addSubview:self.cellText];
        self.cellText.text = @"上城区 | 杭州锐摄影会所";
        self.cellText.font = [UIFont boldSystemFontOfSize:13];
        self.cellText.textColor = [UIColor grayColor];
        [self.cellText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellTag.mas_bottom).offset(6);
            make.left.mas_equalTo(self.cellImage.mas_left);
        }];
        
        self.cellSale = [UILabel new];
        [self addSubview:self.cellSale];
        self.cellSale.text = @"￥3899";
        self.cellSale.font = [UIFont boldSystemFontOfSize:17];
        self.cellSale.textColor = [UIColor colorWithRed:248/255. green:49/255. blue:48/255. alpha:1.0];
        [self.cellSale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellTag.mas_bottom).offset(3);
            make.right.mas_equalTo(self.cellImage.mas_right).offset(0);
        }];
    }
    return self;
}


@end
