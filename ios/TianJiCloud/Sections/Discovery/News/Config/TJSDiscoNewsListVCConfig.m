//
//  TJSDiscoNewsListVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsListVCConfig.h"

#import "DiscoNewsListController.h"

@interface TJSDiscoNewsListVCConfig ()

@property (nonatomic,weak) DiscoNewsListController *vc;


@end

@implementation TJSDiscoNewsListVCConfig

- (void)setup:(DiscoNewsListController *)vc{
    
    _vc = vc;
    
    
}


#pragma mark - TJSNavigationConfig

- (UIView *)tjs_titleView{
  
    
    
    return nil;
   
}


@end
