//
//  dataCell.m
//  myproject
//
//  Created by 何明礼 on 2018/2/25.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "dataCell.h"
#import "dataModel.h"

#import "Masonry.h"


@implementation dataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 自定义cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView {
    self.contentView.backgroundColor = [UIColor blueColor];
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
    _title.textColor = [UIColor redColor];
    _title.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(6);
        make.left.mas_equalTo(18);
    }];
    
    _msg = [UILabel new];
    _msg.textColor = [UIColor grayColor];
    _msg.font =  [UIFont boldSystemFontOfSize:12.0];
    [self.contentView addSubview:_msg];
    [_msg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_title.mas_left);
        make.top.mas_equalTo(_title.mas_bottom).offset(0);
        make.width.mas_equalTo(120);
    }];
}

#pragma mark - 参数设置
- (void)setDatas:(dataModel *)datas
{
    _datas = datas;
    _title.text = datas.bride;
    _msg.text = datas.create_at;
    _imgpath = datas.image;
}


@end
















