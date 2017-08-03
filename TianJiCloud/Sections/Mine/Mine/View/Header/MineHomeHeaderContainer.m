//
//  MineHomeHeaderContainer.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeHeaderContainer.h"

@implementation MineHomeHeaderContainer

#pragma mark -

+ (instancetype)headerContainer{

    MineHomeHeaderContainer *container = [[MineHomeHeaderContainer alloc]init];
    
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/1.75);
    container.backgroundColor = [UIColor redColor];//ThemeService.weak_color_10;
   

    return container;
}


#pragma mark - addSubViews



@end
