//
//  DISTableViewCell.m
//  myproject
//
//  Created by 何明礼 on 2018/2/22.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "DISTableViewCell.h"
#import "DISModel.h"
#import "PureLayout.h"
#import "Masonry.h"

@interface DISTableViewCell ()
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;

/** 内容 */
@property (nonatomic, strong) UILabel *contentLabel;

/** 用户名 */
@property (nonatomic, strong) UILabel *usernameLabel;

/** 时间 */
@property (nonatomic, strong) UILabel *timeLabel;

/** 图片名 */
@property (nonatomic, strong) UIImageView *imageName;

@end


@implementation DISTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
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
    [self setupLayout];
}

/** 初始化子控件 */
- (void)setupSubViews
{
    /** 标题 */
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.backgroundColor = [UIColor redColor];
    
    /** 内容 */
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.contentLabel];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.backgroundColor = [UIColor greenColor];
    
    /** 用户名 */
    self.usernameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.usernameLabel];
    self.usernameLabel.backgroundColor = [UIColor blueColor];
    
    /** 时间 */
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLabel];
    self.timeLabel.backgroundColor = [UIColor yellowColor];
    
    /** 图片 */
    //    self.imageName = [[UIImageView alloc] init];
    //    [self.contentView addSubview:self.imageName];
    //    self.imageName.backgroundColor = [UIColor orangeColor];
    
    
}



/** 初始化子控件Frame */
- (void)setupLayout
{
    /** 利用pureLayOut自动布局 */
    CGFloat padding = 10;
    //    //顶部和左边 == contentView   , 并加上间距
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:padding];
    
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:padding];
    
    
    //左边等于titleLabel的左边
    [self.contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    
    //顶部等于titleLabel的顶部加间距
    [self.contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:padding];
    
    //右边 等于 contentView的右边 , 减一个间距
    [self.contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-padding];
    
    //    [self.contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-padding];
    //
    //    //左边等于desc的左边
    ////    [self.imageName autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentLabel];
    //
    //    //顶部 等于 desc的底部 加 间距
    ////    [self.imageName autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.contentLabel withOffset:padding];
    //
    //    //左边等于contentLabel的左边
    [self.usernameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentLabel];
    //顶部等于imageV的底部加间距
    [self.usernameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.contentLabel withOffset:padding];
    
    //底部等于contentView的底部 减一个间距
    [self.usernameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-padding];
    //
    //右边等于contentView的右边 减一个间距
    [self.timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-padding];
    
    //底部等于username的底部
    [self.timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.usernameLabel];
    
    
    /**< 利用Masonry布局 */
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.contentView).offset(padding);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(padding);
        make.right.equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
    [self.imageName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_left);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(padding);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.imageName ? self.imageName.mas_bottom : self.contentLabel.mas_bottom).offset(padding);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-padding);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.top.equalTo(self.usernameLabel);
        make.right.equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
}



/** 给cell赋值 */
- (void)setTestModel:(DISModel *)colModel
{
    _colModel = colModel;
    self.titleLabel.text = colModel.title;
    self.timeLabel.text = colModel.time;
    self.contentLabel.text = colModel.content;
    self.imageName.image = colModel.imageName.length > 0 ? [UIImage imageNamed:colModel.imageName] : nil;
    self.usernameLabel.text = colModel.username;
}




@end
