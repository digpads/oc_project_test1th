//
//  h1ViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/22.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "h1ViewController.h"
#import "Masonry.h"

@interface h1ViewController ()
@end

@implementation h1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"h1";
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self addtxt];
    
}

-(void)addtxt {
    UILabel *txt = [UILabel new];
    [self.view addSubview:txt];
    txt.text = _data[@"bride"];
    txt.font = [UIFont boldSystemFontOfSize:18.0];
    txt.textColor =  [UIColor colorWithRed:248/255. green:49/255. blue:48/255. alpha:1.0];
    [txt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.left.mas_equalTo(120);
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
