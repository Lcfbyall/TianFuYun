//
//  HomeFooterConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeFooterConfig.h"

#import "HomeWebClickItem.h"

@implementation HomeFooterConfig

+ (NSArray *)items{

    static NSString *const webUrl = @"http://wandou.im/1ig5qp";
    
    HomeWebClickItem  *riskControl = [HomeWebClickItem new];
    riskControl.webUrl   = webUrl;
    riskControl.title    = @"风控保障\n三重认证确保资金安全";
    riskControl.subTitle = @"";
    riskControl.imgUrl   = @"risk_protect";
    riskControl.target   = HomeFooterWebVC;
    riskControl.pushAllowed = YES;
    
    HomeWebClickItem  *onlineSettlement = [HomeWebClickItem new];
    onlineSettlement.webUrl   = webUrl;
    onlineSettlement.title    = @"线上结佣\n国内首家线上佣金结算平台";
    onlineSettlement.subTitle = @"";
    onlineSettlement.imgUrl   = @"online_commsion";
    onlineSettlement.target   = HomeFooterWebVC;
    onlineSettlement.pushAllowed = YES;
    
    HomeWebClickItem  *platBackground   = [HomeWebClickItem new];
    platBackground.webUrl   = webUrl;
    platBackground.title    = @"风控保障\n三重认证确保资金安全";
    platBackground.subTitle = @"";
    platBackground.imgUrl   = @"platform";
    platBackground.target   = HomeFooterWebVC;
    platBackground.pushAllowed = YES;
    
    return @[riskControl,onlineSettlement,platBackground];
}

@end
