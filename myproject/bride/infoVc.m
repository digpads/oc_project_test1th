//
//  infoVc.m
//  myproject
//
//  Created by 何明礼 on 2018/2/26.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "infoVc.h"
#import "Masonry.h"

@interface infoVc ()
@property (nonatomic,strong) UILabel *titLabel;
@end

@implementation infoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"套餐详情";
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self info];
    
}

- (void)info {
    
    _titLabel = [UILabel new];
    _titLabel.text = _tit;
    _titLabel.font = [UIFont boldSystemFontOfSize:16];
    _titLabel.textColor = [UIColor grayColor];
    [self.view addSubview:_titLabel];
    [_titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.centerX.mas_equalTo(0);
    }];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
