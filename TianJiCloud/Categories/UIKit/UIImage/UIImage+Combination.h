//
//  UIImage+Combination.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Combination)

- (UIImage *)tjs_combinateWithImage:(UIImage *)img
                               size:(CGSize)size
                            subrect:(CGRect)subrect;

@end
