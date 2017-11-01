//
//  TJSAppSoreUtil.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSAppSoreUtil.h"
#import "AFNetworking.h"

static NSString *const TianFuYunAPP_ID     = @"";


@implementation TJSAppSoreUtil


/**
 *  获取更新信息
 */
+ (void)tjm_fetchAppVersionInAppStore:(void(^)(void))complete{
    
    
    NSString *updateUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@&country=%@",TianFuYunAPP_ID,@"cn"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:updateUrlString parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSArray *array = responseObject[@"results"];
        //NSDictionary *dict = [array lastObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
}

/**
 *  去下载
 评分：NSString * url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",@"1014939463"];
 */
+ (void)tjm_openAppStoreToDownLoadLocalApp{
    
    NSString *detailUrlString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",TianFuYunAPP_ID];
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:detailUrlString]]){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:detailUrlString]];
    }
    
}

@end
