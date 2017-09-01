//
//  DiscoRoadShowConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowConfig.h"
#import "DiscoRoadShowListController.h"

@interface DiscoRoadShowConfig ()

@property (nonatomic,weak)DiscoRoadShowListController *vc;

@end

@implementation DiscoRoadShowConfig

- (void)setup:(DiscoRoadShowListController *)vc{

    _vc.title = @"";
    
    _vc.view.backgroundColor = ThemeService.weak_color_00;
    
    

}

@end
