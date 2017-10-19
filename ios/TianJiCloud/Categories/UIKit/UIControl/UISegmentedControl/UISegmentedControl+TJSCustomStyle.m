//
//  UISegmentedControl+TJSCustomStyle.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UISegmentedControl+TJSCustomStyle.h"

@implementation UISegmentedControl (TJSCustomStyle)

- (void)tjs_customTitleViewConfig{
 
    self.selectedSegmentIndex = 0;
    self.apportionsSegmentWidthsByContent = YES;
    self.tintColor = ThemeService.main_color_02;
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height/2.0;
    self.layer.borderWidth = 1;
    self.layer.borderColor = ThemeService.main_color_02.CGColor;
    
    /*
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:NSClassFromString(@"UISegment")]){
            [((UIView *)obj).subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull objs, NSUInteger idx, BOOL * _Nonnull stop) {
                if([objs isKindOfClass:NSClassFromString(@"UIImageView")]){
                    ((UIImageView *)objs).layer.masksToBounds = YES;
                    ((UIImageView *)objs).layer.cornerRadius = ((UIImageView *)objs).frame.size.height / 2.0;
                }
            }];
        }}
     ];
     
     
    UIImage *imgNormal = [UIImage tjs_imageWithColor:ThemeService.origin_color_00 size:CGSizeMake(frame.size.width/2.0, frame.size.height) cornerRadius:frame.size.height/2.0];
    UIImage *imgSelected = [UIImage tjs_imageWithColor:ThemeService.main_color_02 size:CGSizeMake(frame.size.width/2.0, frame.size.height) cornerRadius:frame.size.height/2.0];
    [self setBackgroundImage:imgNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setBackgroundImage:imgSelected forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    UIImage *segmentLineSelected = [[UIImage tjs_imageWithColor:ThemeService.origin_color_00] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *segmentLineUnSelected = [[UIImage tjs_imageWithColor:ThemeService.origin_color_00] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self setDividerImage:segmentLineUnSelected forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:segmentLineSelected forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:segmentLineSelected forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
     */
}

@end
