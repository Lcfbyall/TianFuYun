//
//  UIButton+CommitStyle.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIButton+CommitStyle.h"
#import "UIButton+IBInspectableState.h"

@implementation UIButton (CommitStyle)


- (void)tjs_commitBtnStateConfigWithNormalTitle:(NSString *)title{
    
    self.tjs_backGroundColorNormal     = ThemeService.btn_color_00;
    self.tjs_backGroundColorHighlighted= ThemeService.btn_color_01;
    self.tjs_backGroundColorDisabled   = ThemeService.btn_color_02;
    
    self.tjs_titleColorNormal          = ThemeService.btn_color_03;
    self.tjs_titleColorHighlighted     = ThemeService.btn_color_04;
    self.tjs_titleColorDisabled        = ThemeService.btn_color_05;
    
    self.tjs_titleFontNormal           = [ThemeService pingFangSCMediumWithSize:18.0f];
    
    if(title){
        self.tjs_titleNormal           = title;
    }
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 3;
    
}



@end
