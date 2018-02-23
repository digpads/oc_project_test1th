//
//  brideViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "brideViewController.h"
#import "brideCell.h"
#import "brideModel.h"

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
    [self doGetRequest];
    
}

- (void)tableBox {
    CGFloat width=self.view.frame.size.width;
    CGFloat height=self.view.frame.size.height;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[brideCell class] forCellReuseIdentifier:@"cellid"];
    
    [self.view addSubview:_tableView];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    NSString *cellID = @"cellID";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
//    }
    //cell.textLabel.text = [NSString stringWithFormat:@"这是第%li个cell",indexPath.row]];

//    NSLog(_list[indexPath.row][@"title"]);
//    cell.textLabel.text = _list[indexPath.row][@"title"];
    
    brideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    brideModel *all = [brideModel new];
    all.title = _list[indexPath.row][@"title"];
    all.time = _list[indexPath.row][@"day"];
    
    cell.dataModel = all;
    
    return cell;
}

- (void)doGetRequest
{
    NSString *url= @"http://pub.hunliji.com/ds/topic?";
    NSDictionary *parameters=@{@"type":@"area", @"sort":@3, @"city_id":@78};
   
    [[AFHTTPSessionManager manager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress-->%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _data = (NSDictionary *)responseObject;
        _list = _data[@"data"][@"list"];
        NSLog(@"get--responseObject-->%@",_list[0][@"title"]);
        [self tableBox];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-->%@",error);
    }];
}

- (void)requestURL {
    // type=area&sort=3&city_id=78
    [[AFHTTPSessionManager manager] GET:@"http://pub.hunliji.com/ds/topic?" parameters:@{@"type":@"area", @"sort":@3, @"city_id":@78} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success_GET");
        //NSLog(@"%@",responseObject);
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSArray *list = dic[@"data"][@"list"];
        NSNumber *a = dic[@"data"][@"page_count"];
        for (NSDictionary *tempDic in list) {
            NSLog(@"----->%@",tempDic[@"title"]);
            
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
