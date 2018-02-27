//
//  dataView.m
//  myproject
//
//  Created by 何明礼 on 2018/2/25.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "dataView.h"
#import "Masonry.h"


@interface dataView()
@property (nonatomic,strong) UILabel *txt;
@end


@implementation dataView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init {
    
    self = [super init];
    if(self){
        [self index];
    } return self;
    
}

- (void)index {
    _txt = [UILabel new];
    _txt.text = @"我是一个兵";
    _txt.font = [UIFont boldSystemFontOfSize:27.0];
    _txt.textColor = [UIColor blackColor];
    [self addSubview:_txt];
    [_txt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.centerX.mas_equalTo(0);
    }];
}


@end
