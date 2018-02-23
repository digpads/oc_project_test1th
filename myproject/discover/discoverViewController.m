//
//  discoverViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "discoverViewController.h"
#import "AFNetworking.h"

@interface discoverViewController ()

@end

@implementation discoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发现";
    self.view.backgroundColor = [UIColor colorWithRed:248/255. green:49/255. blue:48/255. alpha:1.0];
    
}

- (void)requestURL {
    [[AFHTTPSessionManager manager] POST:@"http://pub.hunliji.com/topic/wedding_card/API" parameters:@{@"groom":@"1", @"bride":@"2"} constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success——gets");
        
        
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
