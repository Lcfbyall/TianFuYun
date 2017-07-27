//
//  UIDevice+CurrentArg.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CurrentArg)

/**
 *  获得当前设备语言
 *
 */
- (NSString*)getPreferredLanguage;


/**
 *   iPhone 7 Plus
 *
 */
- (NSString *)phoneModel;

/*
 *   isSimulator
 *
 */
- (BOOL)isSimulator;


@end
