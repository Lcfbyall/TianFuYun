//
//  UITextView+PlaceHolder.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (PlaceHolder)

/**
 * 占位提示语
 */
@property (nonatomic, copy)   NSString *tjs_placeholder;

/**
 * 占位提示语的字体颜色
 */
@property (nonatomic, strong) UIColor *tjs_placeholderColor;

/**
 * 占位提示语的字体
 */
@property (nonatomic, strong) UIFont  *tjs_placeholderFont;

/**
 *  显示区域Insets
 */
@property (nonatomic, assign) UIEdgeInsets tjs_placeContainerInset;

@end
