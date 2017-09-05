//
//  UIButton+CommitStyle.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CommitStyle)

+ (UIButton *)tjs_commitBtnWithTitle:(NSString *)title;

- (void)tjs_bottomBtnStyle;

- (void)tjs_commitBtnStateConfigWithNormalTitle:(NSString *)title;


+ (UIView *)tjs_logoutBtnForTBFooterWithTitle:(NSString *)title
                              blockForControl:(void (^)(id))block;

+ (UIView *)tjs_commitBtnForTBFooter:(NSString *)title
                               state:(UIControlState)state
                     blockForControl:(void (^)(id))block;

@end
