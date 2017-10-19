//
//  FilterResultVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FilterResultVCConfig.h"
#import "ProductFilterResultController.h"

@interface FilterResultVCConfig ()

@property (nonatomic,weak)ProductFilterResultController *vc;

@end

@implementation FilterResultVCConfig

- (void)setup:(ProductFilterResultController *)vc{
 
    _vc = vc;
    
    _vc.view.backgroundColor = ThemeService.origin_color_00;
    
    _vc.title = @"产品筛选";

}






@end
