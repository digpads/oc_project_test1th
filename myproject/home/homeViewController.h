//
//  homeViewController.h
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import <UIKit/UIKit.h>
@class vc;
@interface homeViewController : UIViewController

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) vc *box;

@property (nonatomic, copy) NSDictionary *cont;
@end
