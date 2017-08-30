//
//  TJSThemeService.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ThemeService [TJSThemeService sharedInstance]


@interface TJSThemeService : NSObject

+ (instancetype)sharedInstance;

//白色
- (UIColor *)origin_color_00;
//黑色
- (UIColor *)origin_color_01;

//主色：白色
- (UIColor *)main_color_00;
- (UIColor *)main_color_01;  //橙色
- (UIColor *)main_color_02;

//文字
- (UIColor *)text_color_00;
- (UIColor *)text_color_01;
- (UIColor *)text_color_02;
- (UIColor *)text_color_03;

// 提交按钮
// 按钮正常时的背景颜色
- (UIColor *)btn_color_00;
// 按钮高亮时的背景颜色
- (UIColor *)btn_color_01;
// 按钮禁用背景颜色
- (UIColor *)btn_color_02;
// 按钮正常文字颜色
- (UIColor *)btn_color_03;
// 按钮高亮文字颜色
- (UIColor *)btn_color_04;
// 按钮禁用文字颜色
- (UIColor *)btn_color_05;

// 页面最底层背景 变强
- (UIColor *)weak_color_00; /**< efeff4 */


#pragma mark - Font

// 平方-细体
- (UIFont *)pingFangSCLightWithSize:(CGFloat)size;  /**< PingFangSC-Light */

// 平方-中黑体
- (UIFont *)pingFangSCMediumWithSize:(CGFloat)size;  /**< PingFangSC-Medium */

// 平方-常规体
- (UIFont *)pingFangSCRegularWithSize:(CGFloat)size;  /**< PingFangSC-Regular */

// 平方-中粗体
- (UIFont *)pingFangSCSemiboldWithSize:(CGFloat)size;  /**< PingFangSC-Semibold */

// 平方-纤细体
- (UIFont *)pingFangSCThinWithSize:(CGFloat)size;  /**< PingFangSC-Thin */

// 平方-极细体
- (UIFont *)pingFangSCUltralightWithSize:(CGFloat)size; /**< PingFangSC-Ultralight */


@end
