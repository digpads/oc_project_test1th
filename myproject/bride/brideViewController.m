//
//  brideViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "brideViewController.h"
#import "AFNetworking.h"
#import "Masonry.h"
#import "MJExtension.h"


@interface brideViewController ()

@end

@implementation brideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新娘说";
    self.view.backgroundColor = [UIColor colorWithRed:110/255. green:130/255. blue:70/255. alpha:1.0];
    [self requestURL];
}

- (void)requestURL {
    // type=area&sort=3&city_id=78
    [[AFHTTPSessionManager manager] GET:@"http://pub.hunliji.com/ds/topic?" parameters:@{@"type":@"area", @"sort":@3, @"city_id":@78} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success_GET");
        //NSLog(@"%@",responseObject);
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSArray *list = dic[@"data"][@"list"];
        NSNumber *a = dic[@"data"][@"page_count"];
        NSLog(@"真心名字：",list[0][@"area_name"]);
        for (NSDictionary *tempDic in list) {
            NSLog(@"%@",tempDic[@"title"]);
            
            UITextView *tit = [UITextView new];
            tit.backgroundColor = [UIColor greenColor];
            [self.view addSubview:tit];
            [tit mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.bottom.mas_equalTo(0);
                make.left.mas_equalTo(0);
            } ];
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed");
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
