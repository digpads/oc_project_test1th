//
//  DISTableViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/22.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "DISTableViewController.h"
#import "DISModel.h"
#import "DISTableViewCell.h"

#import "UITableView+FDTemplateLayoutCell.h"
#import "Masonry.h"
#import "MJExtension.h"


@interface DISTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *listData;
@property (nonatomic, strong) UIButton *test;
@property (nonatomic, strong) UILabel *tex;

@end

@implementation DISTableViewController

static NSString *ID = @"TestCell";

/** 数据懒加载 */
- (NSArray *)listData
{
    if (!_listData) {
        NSString *pathFile= [[NSBundle mainBundle] pathForResource:@"data.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:pathFile];
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        self.listData = [DISModel mj_objectArrayWithKeyValuesArray:dict[@"feed"]];
        [self.tableView reloadData];
        
    }
    return _listData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /** 设置数据源 */
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    /** 注册cell */
    [self.tableView registerClass:[DISTableViewCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DISTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    /** 传递模型 */
    [self setModelOfCell:cell anIndexPath:indexPath];
    
    return cell;
}

- (void)setModelOfCell:(DISTableViewCell *)cell anIndexPath:(NSIndexPath *)indexPath
{
    
    //    cell.fd_enforceFrameLayout = YES;
    cell.colModel = self.listData[indexPath.row];
}

/** 计算行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableView fd_heightForCellWithIdentifier:ID cacheByIndexPath:indexPath configuration:^(DISTableViewCell *cell) {
        [self setModelOfCell:cell anIndexPath:indexPath];
    }];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
