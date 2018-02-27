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
#import "infoVc.h"

#import "AFNetworking.h"
#import "Masonry.h"
#import "MJExtension.h"
#import "MJRefresh.h"


@interface brideViewController ()
@property (nonatomic,copy) NSString *col;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) UITableView *testbox;
@end

@implementation brideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新娘说";
    self.view.backgroundColor = [UIColor colorWithRed:110/255. green:130/255. blue:70/255. alpha:1.0];
    _page=1;
    _list = [NSMutableArray array];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self tableBox];
    //[self getWork:_page];
    
//
//    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateNewdata)];
//    [self.tableView.mj_header beginRefreshing];
//

    MJRefreshGifHeader *touchHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = touchHeader;
    UIImage *d1 = [UIImage imageNamed:@"d1"];
    UIImage *d2 = [UIImage imageNamed:@"d2"];
    UIImage *d3 = [UIImage imageNamed:@"d3"];
    
    [touchHeader setImages:@[d1,d1,d2,d3] forState:MJRefreshStateIdle];
    touchHeader.lastUpdatedTimeLabel.hidden = YES;
    touchHeader.stateLabel.hidden = YES;
    
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    
    MJRefreshAutoGifFooter *touchFooter = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    _tableView.mj_footer = touchFooter;
    
    [touchFooter setTitle:@"" forState:MJRefreshStateIdle];
    [touchFooter setTitle:@"正在加载中..." forState:MJRefreshStateRefreshing];
    [touchFooter setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
  
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([UIApplication sharedApplication].statusBarStyle!=0){
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    NSLog(@"bride状态栏：%d",[UIApplication sharedApplication].statusBarStyle);
}

#pragma mark - 插入table盒子
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

- (void)loadMoreData {
    [self getWork:++_page];
    NSLog(@"从下往上加载：第%ld页",_page);
}


- (void)updateNewdata {
    [_list removeAllObjects];
    _page=1;
    [self getWork:_page];
    NSLog(@"从上往下刷新：第%ld页",_page);
}

- (void)loadNewData {
    [_list removeAllObjects];
    _page=1;
    [self getWork:_page];
    NSLog(@"从上往下刷新：第%ld页",_page);
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    brideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    brideModel *all = [brideModel new];
    all.work_title = _list[indexPath.row][@"title"];
    all.work_describe = _list[indexPath.row][@"describe"];
    all.work_cover_path = _list[indexPath.row][@"cover_path"];

    cell.dataModel = all;
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 120;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了第%li个cell", (long)indexPath.row);
    // [self showWithDic:@{@"name":@"cat",@"age":@18}];
    _col = _list[indexPath.row][@"id"];
    [self href:_col];
    
}

- (void)href:(NSString *)dic{
    infoVc *info = [infoVc new];
    info.tit = dic;
    [self.navigationController pushViewController:info animated:true];
}


#pragma mark - 获取套餐数据
- (void)getWork:(NSInteger)dic{
    NSString *url= @"http://m.hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList";
    NSDictionary *parameters=@{@"city":@0, @"sort[key]":@"default", @"sort[order]":@"desc", @"property":@0, @"commodity_type":@0, @"page":@(dic), @"per_page":@20};
    
    [[AFHTTPSessionManager manager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress-->%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _data = (NSDictionary *)responseObject;
        NSArray *arr = _data[@"works"];
        [_list addObjectsFromArray:arr];
        [self.tableView reloadData];//刷新tableview获取数据
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        //NSLog(@"responseObject-->%@",responseObject);
        
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
