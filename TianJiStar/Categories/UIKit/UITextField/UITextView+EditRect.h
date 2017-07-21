//
//  UITextView+EditRect.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Swizzle.h"

@interface UITextView (EditRect)

@property (nonatomic,assign) CGRect tjs_leftViewRect;
//占位符缩进
@property(nonatomic,assign) CGFloat tjs_placeHolderHeadIndent;


@end
