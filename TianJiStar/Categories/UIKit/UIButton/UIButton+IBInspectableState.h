//
//  UIButton+IBInspectableState.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (IBInspectableState)

@property (strong, nonatomic) IBInspectable UIColor  *tjs_backGroundColorNormal;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_backGroundColorDisabled;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_backGroundColorHighlighted;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_backGroundColorSelected;

@property (strong, nonatomic) IBInspectable UIColor  *tjs_titleColorNormal;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_titleColorDisabled;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_titleColorHighlighted;
@property (strong, nonatomic) IBInspectable UIColor  *tjs_titleColorSelected;

@property (strong, nonatomic) IBInspectable UIFont   *tjs_titleFontNormal;
@property (strong, nonatomic) IBInspectable UIFont   *tjs_titleFontDisabled;
@property (strong, nonatomic) IBInspectable UIFont   *tjs_titleFontHighlighted;
@property (strong, nonatomic) IBInspectable UIFont   *tjs_titleFontSelected;

@property (copy, nonatomic) IBInspectable   NSString *tjs_titleNormal;
@property (copy, nonatomic) IBInspectable   NSString *tjs_titleDisabled;
@property (copy, nonatomic) IBInspectable   NSString *tjs_titleHighlighted;
@property (copy, nonatomic) IBInspectable   NSString *tjs_titleSelected;

/*
 @property (strong, nonatomic) IBInspectable UIColor *tjs_borderColorNormal;
 @property (strong, nonatomic) IBInspectable UIColor *tjs_borderColorDisabled;
 @property (strong, nonatomic) IBInspectable UIColor *tjs_borderColorHighlighted;
 @property (strong, nonatomic) IBInspectable UIColor *tjs_borderColorSelected;
 
 @property (assign, nonatomic) IBInspectable CGFloat tjs_borderWidthNormal;
 @property (assign, nonatomic) IBInspectable CGFloat tjs_borderWidthDisabled;
 @property (assign, nonatomic) IBInspectable CGFloat tjs_borderWidthHighlighted;
 @property (assign, nonatomic) IBInspectable CGFloat tjs_borderWidthSelected;
 */

- (void)tjs_setBackGroundColor:(UIColor *)backGroundColor
                      forState:(UIControlState)state;
- (UIColor *)tjs_backGroundColorForState:(UIControlState)state;

- (void)tjs_setTitleLabelFont:(UIFont *)titleLabelFont
                     forState:(UIControlState)state;
- (UIFont *)tjs_titleLabelFontForState:(UIControlState)state;

- (void)tjs_setTitleColor:(UIColor *)titleColor
                 forState:(UIControlState)state;
- (UIColor *)tjs_titleColorForState:(UIControlState)state;

- (void)tjs_setTitle:(NSString *)title
            forState:(UIControlState)state;
- (NSString *)tjs_titleForState:(UIControlState)state;


- (void)tjs_setBorderColor:(UIColor *)borderColor
                  forState:(UIControlState)state;
- (UIColor *)tjs_borderColorForState:(UIControlState)state;

- (void)tjs_setBorderWidth:(CGFloat)borderWidth
                  forState:(UIControlState)state;
- (CGFloat)tjs_borderWidthForState:(UIControlState)state;


@end
