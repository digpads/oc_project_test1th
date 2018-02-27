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
#import <SDWebImage/UIImageView+WebCache.h>


@interface brideCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *msgLabel;
@property (nonatomic,strong) UIImageView *coverImg;
@property (nonatomic,copy) NSString *cellCol;

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
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.textColor = [UIColor redColor];
    
    _msgLabel = [UILabel new];
    _msgLabel.font = [UIFont boldSystemFontOfSize:11];
    [self.contentView addSubview:_msgLabel];
    _msgLabel.textColor = [UIColor grayColor];
    
    _coverImg = [UIImageView new];
    //_coverImg.contentMode = UIViewContentModeCenter;
    [_coverImg setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _coverImg.contentMode =  UIViewContentModeScaleAspectFill;
    _coverImg.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _coverImg.clipsToBounds  = YES;
    [self.contentView addSubview:_coverImg];
    
    
}

- (void)css {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);

    }];
    
    [_msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.mas_equalTo(_titleLabel.mas_bottom).offset(15);
       make.left.mas_equalTo(10);
       make.right.mas_equalTo(-10);
       
    }];
    
    [_coverImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_msgLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(80);
        
    }];
}



- (void)setDataModel:(brideModel *)dataModel
{
    _dataModel = dataModel;
    _titleLabel.text = dataModel.work_title;
    _msgLabel.text = dataModel.work_describe;
    
    
    [_coverImg sd_setImageWithURL:[NSURL URLWithString:dataModel.work_cover_path] placeholderImage:[UIImage imageNamed:@""]];
    
    _cellCol = dataModel.work_id;

//    NSURL *photourl = [NSURL URLWithString:dataModel.work_cover_path];
//    UIImage *images = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];//通过网络url获取uiimage
//    _coverImg.image = images;
    //_coverImg.image = [UIImage imageNamed:dataModel.work_cover_path];
}


@end
