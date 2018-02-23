//
//  brideCell.m
//  myproject
//
//  Created by 何明礼 on 2018/2/23.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "brideCell.h"
#import "brideModel.h"
#import "Masonry.h"


@interface brideCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@end

@implementation brideCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
    }
    return self;
}

/** 初始化 */
- (void)setup
{
    [self setupSubViews];
    [self css];
}

- (void)setupSubViews {
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.textColor = [UIColor redColor];
    
    _timeLabel = [UILabel new];
    [self.contentView addSubview:_timeLabel];
    _timeLabel.textColor = [UIColor grayColor];
    
}

- (void)css {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.mas_equalTo(-10);
       make.centerY.mas_equalTo(0);
    }];
}


//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//}

- (void)setDataModel:(brideModel *)dataModel
{
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.title;
    self.timeLabel.text = dataModel.time;
}


@end
