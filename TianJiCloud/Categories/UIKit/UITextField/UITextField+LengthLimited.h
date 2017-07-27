//
//  UITextField+LengthLimited.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LengthLimited)

//考虑中文和emoj，所以不需要此方法
//- (BOOL)tjs_shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text maxLimitNums:(NSInteger)maxLimitNums;

//字符
- (void)tjs_didChangeMaxLimitNums:(NSInteger)maxLimitNums;
//字符
- (void)tjs_didChangeMaxInputLimitNums:(NSInteger)maxLimitNums;
//字节
- (void)tjs_didChangeMaxBytesLimitNums:(NSInteger)maxLimitNums;

@end
