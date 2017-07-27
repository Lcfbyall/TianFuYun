//
//  UIButton+TouchAreaInsets.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TouchAreaInsets)

/**
 *  按钮额外热区,即扩大点击范围
 */
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;


@end
