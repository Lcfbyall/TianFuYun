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

    static NSString *const webUrl = @"http://wandou.im/1ig5qp";
    
    HomeWebClickItem *first   = [HomeWebClickItem new];
    first.webUrl    = webUrl;
    first.title     = @"";
    first.subTitle  = @"";
    first.imgUrl    = @"about_risk_4";
    first.target    = HomeHeaderWebVC;
    first.pushAllowed = NO;
    
    HomeWebClickItem  *second = [HomeWebClickItem new];
    second.webUrl    = webUrl;
    second.title    = @"";
    second.subTitle = @"";
    second.imgUrl   = @"about_risk_4";
    second.target   = HomeHeaderWebVC;
    second.pushAllowed = NO;
    
    HomeWebClickItem  *third  = [HomeWebClickItem new];
    third.webUrl    = webUrl;
    third.title     = @"";
    third.subTitle  = @"";
    third.imgUrl    = @"about_risk_4";
    third.target    = HomeHeaderWebVC;
    third.pushAllowed = NO;
    
    return @[first,second,third];
}

+ (NSArray *)productHomeItems{

    
    HomeProductClickItem *recent = [HomeProductClickItem new];
    recent.title           = NSLocalizedString(@"product_type_new",@"最新");
    recent.img             = @"new";
    
    
    HomeProductClickItem *hot = [HomeProductClickItem new];
    hot.title              = NSLocalizedString(@"product_type_hot",@"最热");
    hot.img                = @"hot";
    
    HomeProductClickItem *handpick = [HomeProductClickItem new];
    handpick.title         = NSLocalizedString(@"product_type_Featured",@"精选");
    handpick.img           = @"choice";
    
    HomeProductClickItem *trustTransaction = [HomeProductClickItem new];
    trustTransaction.title = NSLocalizedString(@"product_type_collectivetrust",@"集合信托");
    trustTransaction.img   = @"collective_home";
    
    HomeProductClickItem *assetsManage = [HomeProductClickItem new];
    assetsManage.title     = NSLocalizedString(@"product_type_assetsManage",@"资管计划");
    assetsManage.img       = @"plan_home";
    
    HomeProductClickItem *obligateFound = [HomeProductClickItem new];
    obligateFound.title    =  NSLocalizedString(@"product_type_obligateFound",@"债权基金");
    obligateFound.img      = @"trust_home";
    
    HomeProductClickItem *stockFound = [HomeProductClickItem new];
    stockFound.title       = NSLocalizedString(@"product_type_stockFound",@"股权基金");
    stockFound.img         = @"stock_home";
    
    HomeProductClickItem *securityFound = [HomeProductClickItem new];
    securityFound.title    = NSLocalizedString(@"product_type_securityFound",@"证券基金");
    securityFound.img      = @"securities_home";
    
    
    return @[
             recent,hot,handpick,trustTransaction,
             
             assetsManage,obligateFound,stockFound,securityFound
             
             ];

}

+ (NSArray *)productItems{
    
    
    HomeProductClickItem *recent = [HomeProductClickItem new];
    recent.title                 = NSLocalizedString(@"product_type_new",@"最新");
    recent.count                 = -1;

    
    HomeProductClickItem *hot = [HomeProductClickItem new];
    hot.title                    = NSLocalizedString(@"product_type_hot",@"最热");
    hot.count                    = -1;
    
    
    HomeProductClickItem *handpick = [HomeProductClickItem new];
    handpick.title               = NSLocalizedString(@"product_type_Featured",@"精选");
    handpick.count               = -1;
    
    
    HomeProductClickItem *trustTransaction = [HomeProductClickItem new];
    trustTransaction.title       = NSLocalizedString(@"product_type_collectivetrust",@"集合信托");
    trustTransaction.count       = 10;
    
    
    HomeProductClickItem *assetsManage = [HomeProductClickItem new];
    assetsManage.title           = NSLocalizedString(@"product_type_assetsManage",@"资管计划");
    assetsManage.count           = 20;
    
    
    HomeProductClickItem *obligateFound = [HomeProductClickItem new];
    obligateFound.title          = NSLocalizedString(@"product_type_obligateFound",@"债权基金");
    obligateFound.count          = 30;
    
    
    HomeProductClickItem *stockFound = [HomeProductClickItem new];
    stockFound.title             = NSLocalizedString(@"product_type_stockFound",@"股权基金");
    stockFound.count             = 40;
    
    
    HomeProductClickItem *securityFound = [HomeProductClickItem new];
    securityFound.title          = NSLocalizedString(@"product_type_securityFound",@"证券基金");
    securityFound.count          = 50;
    
    return @[
             
             recent,hot,handpick,trustTransaction,
             
             assetsManage,obligateFound,stockFound,securityFound
             
            ];
}


@end
