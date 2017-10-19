//
//  DiscoRoadShowInfo.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoVideoResolution.h"


@interface DiscoRoadShowInfo : NSObject

/** id  */
@property (nonatomic,assign) NSInteger showid;
/** 标题 */
@property (nonatomic, copy  ) NSString *title;
/** 描述 */
@property (nonatomic, copy  ) NSString *video_description;
/** 视频地址 */
@property (nonatomic, copy  ) NSString *playUrl;
/** 封面图 */
@property (nonatomic, copy  ) NSString *coverForFeed;
/** 视频分辨率的数组 */
@property (nonatomic, strong) NSMutableArray<DiscoVideoResolution *> *playInfo;
/** 头像 */
@property (nonatomic, copy)   NSString *avatarUrl;

///


//@property (nonatomic,copy)    NSString *time;
//
//@property (nonatomic,assign) BOOL hasDownload;
//


@end
