//
//  UISearchBar+CommanStyle.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (CommanStyle)

+ (UIView *)tjs_customStyleWithFrame:(CGRect)frame
                         placeHolder:(NSString *)placeHolder
                               block:(void (^)(id sender))block;

@end
