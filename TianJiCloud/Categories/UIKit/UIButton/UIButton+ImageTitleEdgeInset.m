//
//  UIButton+ImageTitleEdgeInset.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIButton+ImageTitleEdgeInset.h"

@implementation UIButton (ImageTitleEdgeInset)


//通过修改EdgeInsets更改文字和图片的布局
- (void)tjs_titleImageHorizontalAlignmentWithSpace:(float)space {
    
    
    [self tjs_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize   = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize   = [self imageRectForContentRect:contentRect].size;
    
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:  UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:  UIEdgeInsetsMake(0, titleSize.width+space, 0, -titleSize.width - space)];
}

- (void)tjs_imageTitleHorizontalAlignmentWithSpace:(float)space {
    
    
    [self tjs_resetEdgeInsets];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
}


//
- (void)tjs_titleImageVerticalAlignmentWithSpace:(float)space {
    
    [self tjs_verticalAlignmentWithTitleTop:YES space:space];
}

- (void)tjs_imageTitleVerticalAlignmentWithSpace:(float)space {
    
    
    [self tjs_verticalAlignmentWithTitleTop:NO space:space];
}

- (void)tjs_verticalAlignmentWithTitleTop:(BOOL)isTop space:(float)space {
    
    [self tjs_resetEdgeInsets];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    
    //CGRect titleRect   = [self titleRectForContentRect:contentRect];
    //CGRect imageRect   = [self imageRectForContentRect:contentRect];
    
    CGSize titleSize   = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize   = [self imageRectForContentRect:contentRect].size;
    
    float halfWidth    = (titleSize.width + imageSize.width)/2;
    float halfHeight   = (titleSize.height + imageSize.height)/2;
    
    float topInset     = MIN(halfHeight, titleSize.height);
    float leftInset    = (titleSize.width - imageSize.width)>0?(titleSize.width - imageSize.width)/2:0;
    float bottomInset  = (titleSize.height - imageSize.height)>0?(titleSize.height - imageSize.height)/2:0;
    float rightInset   = MIN(halfWidth, titleSize.width);
    
    if (isTop)
    {
        
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-halfHeight-space,
                                                  - halfWidth,
                                                  halfHeight+space,
                                                  halfWidth)];
        
        [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space,
                                                    leftInset,
                                                    -bottomInset,
                                                    -rightInset)];
    }
    else
    {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(halfHeight+space,
                                                  - halfWidth,
                                                  -halfHeight-space,
                                                  halfWidth)];
        
        [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset,
                                                    leftInset,
                                                    topInset+space,
                                                    -rightInset)];
    }
}


- (void)tjs_resetEdgeInsets {
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:  UIEdgeInsetsZero];
    [self setTitleEdgeInsets:  UIEdgeInsetsZero];
}


@end
