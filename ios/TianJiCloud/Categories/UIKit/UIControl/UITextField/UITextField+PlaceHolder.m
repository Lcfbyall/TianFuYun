//
//  UITextField+PlaceHolder.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITextField+PlaceHolder.h"

@implementation UITextField (PlaceHolder)


/**
 * 占位提示语颜色
 */
- (void)setTjs_placeHolderColor:(UIColor *)tjs_placeHolderColor
{
    [self setValue:tjs_placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
}
- (UIColor *)tjs_placeHolderColor
{
    return  [self valueForKeyPath:@"_placeholderLabel.textColor"];
}
- (void)setTjs_placeHolderFont:(UIFont *)tjs_placeHolderFont
{
    [self setValue:tjs_placeHolderFont forKeyPath:@"_placeholderLabel.font"];
}
- (UIFont *)tjs_placeHolderFont
{
    return  [self valueForKeyPath:@"_placeholderLabel.font"];
}


@end
