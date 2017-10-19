//
//  UILabel+TJSEdgeInsets.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/4/26.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UILabel+TJSEdgeInsets.h"
#import "NSObject+Swizzle.h"

@implementation UILabel (TJSEdgeInsets)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tjs_swizzleInstanceMethod([self class],
                              @selector(drawTextInRect:),
                              @selector(tjs_drawTextInRect:));
        
        tjs_swizzleInstanceMethod([self class],
                                  @selector(intrinsicContentSize),
                                  @selector(tjs_intrinsicContentSize));
    });
}


- (CGSize)tjs_intrinsicContentSize{
 
    CGSize orignal = [self tjs_intrinsicContentSize];
    
    
    if(!UIEdgeInsetsEqualToEdgeInsets(self.tjs_edgeInsets, UIEdgeInsetsMake(0, 0, 0, 0))){
        
        return CGSizeMake(orignal.width+self.tjs_edgeInsets.left+self.tjs_edgeInsets.right, orignal.height+self.tjs_edgeInsets.top+self.tjs_edgeInsets.bottom);
        
    }
    
    return orignal;
}

- (void)tjs_drawTextInRect:(CGRect)rect{
    
    if(!UIEdgeInsetsEqualToEdgeInsets(self.tjs_edgeInsets, UIEdgeInsetsMake(0, 0, 0, 0))){
    
        rect = CGRectMake(rect.origin.x+self.tjs_edgeInsets.left,
                          rect.origin.y+self.tjs_edgeInsets.top,
                          rect.size.width-self.tjs_edgeInsets.left-self.tjs_edgeInsets.right,
                          rect.size.height-self.tjs_edgeInsets.top-self.tjs_edgeInsets.bottom);
    }
    
    
    [self tjs_drawTextInRect:rect];
}


- (void)setTjs_edgeInsets:(UIEdgeInsets)tjs_edgeInsets{
  
        objc_setAssociatedObject(self, @selector(tjs_edgeInsets), [NSValue valueWithUIEdgeInsets:tjs_edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIEdgeInsets)tjs_edgeInsets{
  
    return  [objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];
}



@end
