//
//  TJSThemeService.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ThemeService [TJSThemeService sharedInstance]


@interface TJSThemeService : NSObject

+ (instancetype)sharedInstance;




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
