//
//  UITextView+LengthLimited.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LengthLimited)

@property (nonatomic,assign) NSInteger tjs_minLimitNums;

@property (nonatomic,assign) NSInteger tjs_maxLimitNums;


- (BOOL)tjs_shouldChangeTextInRange:(NSRange)range
                    replacementText:(NSString *)text
                       maxLimitNums:(NSInteger)maxLimitNums;

- (void)tjs_didChangeMaxLimitNums:(NSInteger)maxLimitNums;


@end
