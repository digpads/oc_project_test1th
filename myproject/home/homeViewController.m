//
//  homeViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "homeViewController.h"
#import "h1ViewController.h"
#import "dataModel.h"

#import "AFNetworking.h"
#import "MJExtension.h"


@interface homeViewController ()<UINavigationControllerDelegate>

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"首页";
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 220, 120, 50)];
    [_btn setTitle:@"homebtn" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(h1Win:) forControlEvents:UIControlEventTouchUpInside];
    
     self.navigationController.delegate = self;
    
    [self requestURL];
    
}

-(void)requestURL
{

    NSString *url= @"http://pub.hunliji.com/topic/wedding_card/API";
    NSDictionary *parameters=@{@"groom":@"nini", @"bride":@"wowo"};
    
    [[AFHTTPSessionManager manager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"downloadProgress-->%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _cont = (NSDictionary *)responseObject;
        
        NSString *name = _cont[@"groom"];
        
        NSLog(name);
        
        //NSLog(@"responseObject-->%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-->%@",error);
    }];
}


- (void)h1Win:(id)sender {
    h1ViewController *box = [h1ViewController new];
    box.data = _cont;
    [self.navigationController pushViewController:box animated:true];
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
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
