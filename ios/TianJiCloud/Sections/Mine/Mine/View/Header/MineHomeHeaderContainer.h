//
//  MineHomeHeaderContainer.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "TJSMineHomeConfigurateProtocol.h"

@interface MineHomeHeaderContainer : UIView

+ (instancetype)headerContainer;

- (void)p_scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)tjs_reloadTableHeader;

@property (nonatomic,weak) id<TJSMineHomeInteractor> interactor;

@end
