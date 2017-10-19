//
//  DiscoRoadShowInfo.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowInfo.h"

@implementation DiscoRoadShowInfo

//NSObject+YYModel
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{
             @"showid": @"id",
             @"video_description":@"description",
             
             };
}

//NSObject+YYModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
 
 return  @{@"playInfo":[DiscoVideoResolution class]};
    
}



@end
