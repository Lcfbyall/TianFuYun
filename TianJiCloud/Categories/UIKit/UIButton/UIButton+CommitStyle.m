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
    self.layer.cornerRadius  = 3;
}


+ (UIButton *)tjs_commitBtnWithTitle:(NSString *)title{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    btn.frame = CGRectMake(0, 0, SCREEN_WIDTH-16*2, 40);
    
    [btn tjs_commitBtnStateConfigWithNormalTitle:title];
    
    return btn;
}


+ (UIView *)tjs_commitBtnForTBFooter:(NSString *)title
                     blockForControl:(void (^)(id))block{

    UIView *bgView = [UIView new];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 90);
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame  = CGRectMake(0, 0, SCREEN_WIDTH-16*2, 50);
    
    btn.center = CGPointMake(bgView.bounds.size.width/2.0, bgView.bounds.size.height/2.0);
    
    [btn tjs_commitBtnStateConfigWithNormalTitle:title];
    
    [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        if(block){
          
            block(sender);
        }
        
    }];
    
    [bgView addSubview:btn];
    
    return bgView;
}


@end


