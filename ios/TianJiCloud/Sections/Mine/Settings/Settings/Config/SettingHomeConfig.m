//
//  SettingHomeConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeConfig.h"
#import "MineSettingViewController.h"
#import "UIBarButtonItem+TJSCustom.h"

@interface SettingHomeConfig ()

@property (nonatomic,weak)MineSettingViewController *vc;

@end

@implementation SettingHomeConfig

- (void)setup:(MineSettingViewController *)vc{

    _vc = vc;
    
    _vc.view.backgroundColor = ThemeService.main_color_01;

    _vc.navigationItem.leftBarButtonItems = [self tjs_leftBarButtonItems];

    _vc.params = [UINavigationBar translucentWhiteTint];
}


#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{
    UIBarButtonItem *left = [UIBarButtonItem tjs_backTitleWhiteImage];
    return @[left];
}


@end
