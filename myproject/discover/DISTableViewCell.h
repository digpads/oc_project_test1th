//
//  DISTableViewCell.h
//  myproject
//
//  Created by 何明礼 on 2018/2/22.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import <UIKit/UIKit.h>
@class dataModel;

@interface DISTableViewCell : UITableViewCell


/** 传递模型数据 */
@property (nonatomic, strong) dataModel *colModel;

/** 快速创建cell */
//+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
