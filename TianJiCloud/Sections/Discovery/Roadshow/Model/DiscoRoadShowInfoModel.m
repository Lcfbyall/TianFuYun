//
//  DiscoRoadShowInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowInfoModel.h"

@interface DiscoRoadShowInfoModel ()

@end

@implementation DiscoRoadShowInfoModel


+ (NSMutableArray <DiscoRoadShowInfoModel *>*)configModelWithShowInfos:(NSArray <DiscoRoadShowInfo *>*)showInfos{

    NSMutableArray *showInfoModels = [NSMutableArray array];
     [showInfos enumerateObjectsUsingBlock:^(DiscoRoadShowInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         
         DiscoRoadShowInfoModel *infoModel = [DiscoRoadShowInfoModel new];
         
         DiscoRoadShowInfo *showInfo = (DiscoRoadShowInfo *)obj;
         
         // 分辨率字典（key:分辨率名称，value：分辨率url)
         NSMutableDictionary *dic = @{}.mutableCopy;
         for (DiscoVideoResolution * resolution in showInfo.playInfo) {
             [dic setValue:resolution.url forKey:resolution.name];
         }
         // 取出字典中的第一视频URL
         NSURL *videoURL = [NSURL URLWithString:dic.allValues.firstObject];
         
         ZFPlayerModel *videoInfo = [[ZFPlayerModel alloc] init];
         videoInfo.title            = showInfo.title;
         videoInfo.videoURL         = videoURL;
         videoInfo.placeholderImageURLString = showInfo.coverForFeed;
         // 赋值分辨率字典
         videoInfo.resolutionDic    = dic;
         
         infoModel.showInfo = showInfo;
         infoModel.videoInfo = videoInfo;
         
         [showInfoModels addObject:infoModel];
         
     }];
    
    return showInfoModels;
}


- (void)setScrollView:(UIScrollView *)scrollView{

    self.videoInfo.scrollView = scrollView;
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
 
    self.videoInfo.indexPath = indexPath;
}

- (void)setFatherViewTag:(NSInteger)fatherViewTag{
   
    self.videoInfo.fatherViewTag = fatherViewTag;
}


@end
