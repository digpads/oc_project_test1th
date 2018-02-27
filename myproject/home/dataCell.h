//
//  dataCell.h
//  myproject
//
//  Created by 何明礼 on 2018/2/25.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import <UIKit/UIKit.h>
@class dataModel;
@interface dataCell : UITableViewCell
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *msg;
@property (nonatomic,strong) dataModel *datas;

@property (nonatomic,copy) NSString *imgpath;
@end
