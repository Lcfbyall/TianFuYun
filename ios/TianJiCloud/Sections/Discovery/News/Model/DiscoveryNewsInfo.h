//
//  DiscoveryNewsInfo.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoveryNewsInfo : NSObject

/** id  */
@property (nonatomic,assign)  NSInteger newsid;
/** 标题 */
@property (nonatomic, copy  ) NSString *title;
/** 视频地址 */
@property (nonatomic, copy  ) NSString *playUrl;
/** 封面图 */
@property (nonatomic, copy  ) NSString *coverForFeed;
/** 头像 */
@property (nonatomic, copy)   NSString *avatarUrl;


@end
