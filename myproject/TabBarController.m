//
//  TabBarController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "TabBarController.h"
#import "homeViewController.h"
#import "discoverViewController.h"
#import "brideViewController.h"
#import "weddingViewController.h"
#import "aboutViewController.h"
#import "Masonry.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addChildVc:[[homeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"home_red"];
    [self addChildVc:[discoverViewController new] title:@"发现" image:@"found" selectedImage:@"found_red"];
    [self addChildVc:[brideViewController new] title:@"新娘说" image:@"talk" selectedImage:@"talk_red"];
    [self addChildVc:[weddingViewController new] title:@"婚礼购" image:@"tool" selectedImage:@"tool_red"];
    [self addChildVc:[aboutViewController new] title:@"关于我们" image:@"we" selectedImage:@"we_red"];
    
}



- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
//    //改变tabbar 线条颜色
//    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context,[UIColor colorWithRed:231/255. green:231/255. blue:231/255. alpha:1.0].CGColor);
//    CGContextFillRect(context, rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.tabBar setShadowImage:img];
    
    
    //tabbar 背景色
    CGRect rectc = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rectc.size);
    CGContextRef contextc = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextc, [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1].CGColor);
    CGContextFillRect(contextc, rectc);
    UIImage *imagec = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:imagec];
    
    //移除顶部线条
    //self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    
    //添加阴影
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    self.tabBar.layer.shadowOpacity = 0.1;
    
    childVc.title = title;
   // if(title == @"首页"){childVc.tabBarItem.badgeValue=@"123";}
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-5)]; //文字偏移
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-6, 0, 0, 0); //图片偏移
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 每一个控制器都是导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    //navigationVc.navigationBar.translucent = NO;
    [self addChildViewController:navigationVc];
    
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:10]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:10]} forState:UIControlStateSelected];
   
  
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
