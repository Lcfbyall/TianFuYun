//
//  UIButton+ImageTitleEdgeInset.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageTitleEdgeInset)


- (void)tjs_titleImageHorizontalAlignmentWithSpace:(float)space;

- (void)tjs_imageTitleHorizontalAlignmentWithSpace:(float)space;

- (void)tjs_titleImageVerticalAlignmentWithSpace:(float)space;

- (void)tjs_imageTitleVerticalAlignmentWithSpace:(float)space;

- (void)tjs_resetEdgeInsets;


@end
