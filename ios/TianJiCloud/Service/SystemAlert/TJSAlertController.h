//
//  TJSAlertController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJSAlertAction : UIAlertAction

/* 1.*< 按钮title字体颜色 */
@property (nonatomic,strong) UIColor *textColor;

@end


@interface TJSAlertController : UIAlertController

/* 1. *< 统一按钮样式 不写系统默认的蓝色 */
@property (nonatomic,strong) UIColor *tintColor;
/* 2.*< 确定或者事件按钮的颜色 */
@property (nonatomic,strong) UIColor *actionColor;
/* 3.*< 取消按钮的颜色 */
@property (nonatomic,strong) UIColor *cancelColor;
/* 4.*< 标题的颜色 */
@property (nonatomic,strong) UIColor *titleColor;
/* 5.*< 信息的颜色 */
@property (nonatomic,strong) UIColor *messageColor;
/* 6.*< 信息的对齐方式 */
@property (nonatomic,assign) NSTextAlignment messageAlignment;


@end
