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


+ (UIButton *)tjs_commitBtnWithTitle:(NSString *)title{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    btn.frame = CGRectMake(0, 0, SCREEN_WIDTH-16*2, 40);
    
    [btn tjs_commitBtnStateConfigWithNormalTitle:title];
    
    return btn;
}

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




#pragma mark - UITableView FooterView

+ (UIView *)tjs_logoutBtnForTBFooterWithTitle:(NSString *)title
                            blockForControl:(void (^)(id))block{
    
    UIView *bgview = [self tjs_commitBtnForTBFooter:title
                                             height:55
                                         edgeInsets:UIEdgeInsetsMake(10, 0, 10, 0)
                                        configBlock:^(id sender) {
        
        UIButton *btn = (UIButton *)sender;
        btn.tjs_backGroundColorNormal     = ThemeService.origin_color_00;
        btn.tjs_backGroundColorHighlighted= ThemeService.weak_color_00;
        
        btn.tjs_titleColorNormal          = [UIColor redColor];
        btn.tjs_titleColorHighlighted     = [UIColor redColor];
        
        btn.tjs_titleFontNormal           = [ThemeService pingFangSCMediumWithSize:18.0f];
        
        if(title){
            
            btn.tjs_titleNormal           = title;
        }
                                            
    } blockForControl:^(id sender) {
        
        block(((UIButton *)sender));
        
    }];
    
    bgview.backgroundColor = ThemeService.weak_color_00;
    
    return bgview;
}

+ (UIView *)tjs_commitBtnForTBFooter:(NSString *)title
                               state:(UIControlState)state
                     blockForControl:(void (^)(id))block{

    UIView *bgview = [self tjs_commitBtnForTBFooter:title
                                             height:50
                                         edgeInsets:UIEdgeInsetsMake(20, 16, 20, 16)
                                        configBlock:^(id sender) {
        
        [((UIButton *)sender) tjs_commitBtnStateConfigWithNormalTitle:title];
                                            
    } blockForControl:^(id sender) {
        
        block(((UIButton *)sender));
        
    }];
    
    bgview.backgroundColor = ThemeService.weak_color_00;

    UIButton *btn = [bgview viewWithTag:1111];

    if(state == UIControlStateDisabled) btn.enabled = NO;

    if(state == UIControlStateSelected) btn.selected = YES;

    if(state == UIControlStateHighlighted) btn.highlighted=YES;

    return bgview;
}




#pragma mark - Private

+ (UIView *)tjs_commitBtnForTBFooter:(NSString *)title
                              height:(CGFloat)height
                          edgeInsets:(UIEdgeInsets)edgeInsets
                         configBlock:(void (^)(id)) configBlock
                     blockForControl:(void (^)(id)) block{

    UIView *bgView = [UIView new];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height + edgeInsets.top + edgeInsets.bottom);
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 1111;
    btn.frame  = CGRectMake(0, 0, SCREEN_WIDTH-edgeInsets.left-edgeInsets.right, height);
    
    btn.center = CGPointMake(bgView.bounds.size.width/2.0, bgView.bounds.size.height/2.0);
    
    if(configBlock)configBlock(btn);
    
    [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        if(block){
          
            block(sender);
        }
    }];
    
    [bgView addSubview:btn];
    
    return bgView;
}


@end


