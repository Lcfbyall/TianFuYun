//
//  DiscoRoadShowInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoRoadShowInfo.h"
#import "ZFPlayerModel.h"

@interface DiscoRoadShowInfoModel : NSObject

@property (nonatomic,strong) DiscoRoadShowInfo *showInfo;

@property (nonatomic,strong) ZFPlayerModel *videoInfo;

- (void)setScrollView:(UIScrollView *)scrollView;

- (void)setIndexPath:(NSIndexPath *)indexPath;

- (void)setFatherViewTag:(NSInteger)fatherViewTag;
    
+ (NSMutableArray <DiscoRoadShowInfoModel *>*)configModelWithShowInfos:(NSArray <DiscoRoadShowInfo *>*)showInfos;

@end
