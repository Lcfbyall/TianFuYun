//
//  HomeHeaderConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeHeaderConfig.h"

#import "HomeWebClickItem.h"
#import "HomeProductClickItem.h"

@implementation HomeHeaderConfig

+ (NSArray *)webItems{

    HomeWebClickItem *first   = [HomeWebClickItem new];
    first.title    = @"";
    first.subTitle = @"";
    first.imgUrl   = @"about_risk_4";
    first.target   = @"HomeHeaderWebController";
    first.pushAllowed = NO;
    
    HomeWebClickItem  *second = [HomeWebClickItem new];
    second.title    = @"";
    second.subTitle = @"";
    second.imgUrl   = @"about_risk_4";
    second.target   = @"HomeHeaderWebController";
    second.pushAllowed = NO;
    
    HomeWebClickItem  *third  = [HomeWebClickItem new];
    third.title    = @"";
    third.subTitle = @"";
    third.imgUrl   = @"about_risk_4";
    third.target   = @"HomeHeaderWebController";
    third.pushAllowed = NO;
    
    return @[first,second,third];
}

+ (NSArray *)productHomeItems{

    
    HomeProductClickItem *recent = [HomeProductClickItem new];
    recent.title           = @"最新";
    recent.img             = @"new";
    
    
    HomeProductClickItem *hot = [HomeProductClickItem new];
    hot.title              = @"最热";
    hot.img                = @"hot";
    
    HomeProductClickItem *handpick = [HomeProductClickItem new];
    handpick.title         = @"精选";
    handpick.img           = @"choice";
    
    HomeProductClickItem *trustTransaction = [HomeProductClickItem new];
    trustTransaction.title = @"集合信托";
    trustTransaction.img   = @"collective_home";
    
    HomeProductClickItem *assetsManage = [HomeProductClickItem new];
    assetsManage.title     = @"资管计划";
    assetsManage.img       = @"plan_home";
    
    HomeProductClickItem *obligateFound = [HomeProductClickItem new];
    obligateFound.title    = @"债权基金";
    obligateFound.img      = @"trust_home";
    
    HomeProductClickItem *stockFound = [HomeProductClickItem new];
    stockFound.title       = @"股权基金";
    stockFound.img         = @"stock_home";
    
    HomeProductClickItem *securityFound = [HomeProductClickItem new];
    securityFound.title    = @"证券基金";
    securityFound.img      = @"securities_home";
    
    
    return @[
             recent,hot,handpick,trustTransaction,
             
             assetsManage,obligateFound,stockFound,securityFound
             
             ];

}

+ (NSArray *)productItems{
    
    
    HomeProductClickItem *recent = [HomeProductClickItem new];
    recent.title                 = @"最新";
    recent.count                 = -1;

    
    HomeProductClickItem *hot = [HomeProductClickItem new];
    hot.title                    = @"最热";
    hot.count                    = -1;
    
    
    HomeProductClickItem *handpick = [HomeProductClickItem new];
    handpick.title               = @"精选";
    handpick.count               = -1;
    
    
    HomeProductClickItem *trustTransaction = [HomeProductClickItem new];
    trustTransaction.title       = @"集合信托";
    trustTransaction.count       = 10;
    
    
    HomeProductClickItem *assetsManage = [HomeProductClickItem new];
    assetsManage.title           = @"资管计划";
    assetsManage.count           = 20;
    
    
    HomeProductClickItem *obligateFound = [HomeProductClickItem new];
    obligateFound.title          = @"债权基金";
    obligateFound.count          = 30;
    
    
    HomeProductClickItem *stockFound = [HomeProductClickItem new];
    stockFound.title             = @"股权基金";
    stockFound.count             = 40;
    
    
    HomeProductClickItem *securityFound = [HomeProductClickItem new];
    securityFound.title          = @"证券基金";
    securityFound.count          = 50;
    
    return @[
             
             recent,hot,handpick,trustTransaction,
             
             assetsManage,obligateFound,stockFound,securityFound
             
            ];
}


@end
