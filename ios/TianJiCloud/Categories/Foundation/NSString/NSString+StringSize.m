//
//  NSString+StringSize.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)

- (CGSize)tjs_stringSizeWithFont:(UIFont *)font size:(CGSize)size {
    
    CGSize resultSize;
    
    // 段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    // 字体大小，换行模式
    NSDictionary *attributes =
    
      @{
        
        NSFontAttributeName : font ,
        NSParagraphStyleAttributeName : style
        
        };
    
    resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return resultSize;
}


@end
