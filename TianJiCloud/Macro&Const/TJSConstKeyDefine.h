//
//  TJSConstKeyDefine.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSConstKeyDefine_h
#define TJSConstKeyDefine_h

#import <Foundation/Foundation.h>

#pragma mark - storyboard
static NSString *const MainSB      = @"Main";

static NSString *const HomeSB      = @"Home";
static NSString *const ProductSB   = @"Product";
static NSString *const DiscoverySB = @"Discovery";
static NSString *const MineSB      = @"Mine";

#pragma mark - main identifier 
static NSString *const MainTabBar  = @"MainTabBar";

#pragma mark - navigaitonVC identifier
static NSString *const HomeNC      = @"HomeNC";
static NSString *const ProductNC   = @"ProductNC";
static NSString *const DiscoveryNC = @"DiscoveryNC";
static NSString *const MineNC      = @"MineNC";

#pragma mark - VC identifier
static NSString *const HomeVC       = @"HomeViewController";
static NSString *const ProductVC    = @"ProductListViewController";
static NSString *const DiscoveryVC  = @"DiscoveryViewController";
static NSString *const MineVC       = @"MineViewController";

////////////////////////////////
#pragma mark - MessageVC identifier
static NSString *const MessageKindListVC    = @"MessageKindListController";
static NSString *const PersonalMessageListVC= @"PersonalMessageController";
static NSString *const PlatAnnounceListVC   = @"PlatformAnnounceController";
static NSString *const AllActivityListVC    = @"AllActivityViewController";

#pragma mark - ProductFilterVC identifier
static NSString *const ProductFilterVC      = @"ProductFilterController";

#pragma mark - ProductDetailVC identifier
static NSString *const ProductDetailVC      = @"TJSProductDetailController";

#pragma mark - ProductSearchVC identifier
static NSString *const ProductSearchVC      = @"ProductSearchController";

#pragma mark - DiscoveryVC identifier

static NSString *const DiscoryNewsListVC    = @"DiscoNewsListController";
static NSString *const DiscoryNewsDetailVC  = @"DiscoNewsDetailController";

static NSString *const DiscoryRoadShowListVC = @"DiscoRoadShowListController";







#endif /* TJSConstKeyDefine_h */
