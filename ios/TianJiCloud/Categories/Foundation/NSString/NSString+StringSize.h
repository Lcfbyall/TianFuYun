//
//  NSString+StringSize.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (StringSize)

- (CGSize)tjs_stringSizeWithFont:(UIFont *)font size:(CGSize)size;
    


@end
