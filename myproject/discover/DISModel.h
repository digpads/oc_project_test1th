//
//  DISModel.h
//  myproject
//
//  Created by 何明礼 on 2018/2/22.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DISModel : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 内容 */
@property (nonatomic, copy) NSString *content;

/** 用户名 */
@property (nonatomic, copy) NSString *username;

/** 时间 */
@property (nonatomic, copy) NSString *time;

/** 图片名 */
@property (nonatomic, copy) NSString *imageName;



@end
