//
//  homeHeadUIView.m
//  myproject
//
//  Created by 何明礼 on 2018/2/27.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "homeHeadUIView.h"
#import "Masonry.h"

@interface homeHeadUIView()
@property (nonatomic,strong) UIImageView *topImg;
@property (nonatomic,strong) UIImageView *msgImg;
@property (nonatomic,strong) UIImageView *carImg;


@end

@implementation homeHeadUIView

- (instancetype)init {
    
    self = [super init];
    if(self){
        [self setup];
    } return self;
    
}
- (void)setup {
    [self headtop];
}

#pragma mark - home轮播与tools区域
- (void)headtop {
    _topImg = [UIImageView new];
    _topImg.image = [UIImage imageNamed:@"demo1"];
    [self addSubview:_topImg];
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
    }];
}

@end






