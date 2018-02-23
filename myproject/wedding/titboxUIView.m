//
//  titboxUIView.m
//  myproject
//
//  Created by 何明礼 on 2018/2/18.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "titboxUIView.h"
#import "Masonry.h"

@implementation titboxUIView

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
        [self pics];
        [self topic];
    } return self;
    
}



- (void)index {
    
    NSString *name = @"HI, Cherry桃乐丝";
    UILabel *title = [UILabel new];
    [self addSubview:title];
    title.text = name;
    title.font = [UIFont boldSystemFontOfSize:27.0];
    title.textColor = [UIColor blackColor];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    
    NSString *msg = @"选择备婚阶段，定制你的婚礼购清单";
    self.msgbox = [UILabel new];
    [title addSubview:_msgbox];
    _msgbox.textColor = [UIColor grayColor];
    _msgbox.text = msg;
    _msgbox.font = [UIFont boldSystemFontOfSize:16.0];
    [_msgbox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(5);
        make.left.mas_equalTo(0);
    }];
    
    UIImageView *fd = [UIImageView new];
    [title addSubview:fd];
    fd.image = [UIImage imageNamed:@"fd"];
    [fd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-35);
    }];
    
    UIImageView *sc = [UIImageView new];
    [title addSubview:sc];
    sc.image = [UIImage imageNamed:@"msg"];
    [sc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    UIImageView *line = [UIImageView new];
    line.image = [UIImage imageNamed:@"line"];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(title.mas_bottom).offset(145);
    }];
    
}

- (void)pics {
    self.picbox = nil;
    for (NSInteger i=1; i<4; i++) {
        self.pic = [UIImageView new];
        _pic.image = [UIImage imageNamed:[NSString stringWithFormat:@"mk%ld",i]];
        [self addSubview:_pic];
        [_pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_msgbox.mas_bottom).offset(15);
            if(!_picbox){
                make.left.mas_equalTo(20);
            }else{
                make.left.mas_equalTo(_picbox.mas_right).offset(15);
            }
        }];
        _picbox = _pic;
    }
}

- (void)topic {
    UIView *tpbox = nil;
    for (NSInteger i=1;i<6;i++){
        UIImageView *tp = [UIImageView new];
        tp.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_%ldth",i]];
        [self addSubview:tp];
        [tp mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_picbox.mas_bottom).offset(40);
            if(!tpbox){
                make.left.mas_equalTo(21);
            }else{
                make.left.mas_equalTo(tpbox.mas_right).offset(20);
            }
        }];
        tpbox = tp;
    }
    
}




@end
