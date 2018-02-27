//
//  homeViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "homeViewController.h"
#import "h1ViewController.h"
#import "dataCell.h"
#import "dataModel.h"
#import "dataView.h"
#import "homeHeadUIView.h"

#import "AFNetworking.h"
#import "MJExtension.h"
#import "Masonry.h"


@interface homeViewController ()<UINavigationControllerDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSString *col;
@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"首页1";

    self.navigationController.delegate = self;
    
    //顶部状态栏黑色改变成白色
    self.edgesForExtendedLayout = 0;
    
    
    
    [self requestURL];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([UIApplication sharedApplication].statusBarStyle!=1){
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
     NSLog(@"home状态栏：%d",[UIApplication sharedApplication].statusBarStyle);
}

#pragma mark - tableBox
- (void)tableBox {
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor greenColor];
    [self.tableView registerClass:[dataCell class] forCellReuseIdentifier:@"cellid"];
    
    [self.view addSubview:_tableView];
    
    NSLog(@"tablecell:%@",_cont[@"bride"]);
    
    //header 与 tableview 顶部间隙；
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    dataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    dataModel *data = [dataModel new];
    data.bride = _cont[@"groom"];
    data.create_at = _cont[@"create_at"];
    cell.datas = data;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 800;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor grayColor];

//    UILabel *txt = [UILabel new];
//    txt.text = @"我很喜欢";
//    txt.textColor = [UIColor whiteColor];
//    txt.font = [UIFont boldSystemFontOfSize:11.0];
//    [headerView addSubview:txt];
//    [txt mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.top.mas_equalTo(20);
//    }];
    
    homeHeadUIView *hHbox = [homeHeadUIView new];
    [headerView addSubview:hHbox];
    [hHbox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了第%li个cell", (long)indexPath.row);
    NSLog(@"点击整个cell%ld",indexPath.section);
   // [self showWithDic:@{@"name":@"cat",@"age":@18}];
    [self href:indexPath.row];
    
}

#pragma mark - [NSString stringWithFormat:@"%ld", _name] //转换数据类型并赋值
- (void)href:(NSUInteger)dic {
    h1ViewController *box = [h1ViewController new];
    box.name = [NSString stringWithFormat:@"%ld", dic];;
    [self.navigationController pushViewController:box animated:true];
}


- (void)showWithDic:(NSDictionary *)dic {
    NSString *name = dic[@"name"];
    NSString *age = dic[@"age"];
    NSLog(@"name: %@, age: %@", name, age);
}

-(void)requestURL
{

    NSString *url= @"http://pub.hunliji.com/topic/wedding_card/API";
    NSDictionary *parameters=@{@"groom":@"但是开发", @"bride":@"留的家"};
    
    [[AFHTTPSessionManager manager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"downloadProgress-->%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _cont = (NSDictionary *)responseObject;
        [self tableBox];
        NSString *name = _cont[@"groom"];
        
        NSLog(name);
        
        //NSLog(@"responseObject-->%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-->%@",error);
    }];
}


- (void)h1Win:(id)sender {
    h1ViewController *box = [h1ViewController new];
    //box.data = _cont;
    box.name = _col;
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
