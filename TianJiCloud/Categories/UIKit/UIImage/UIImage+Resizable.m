//
//  UIImage+Resizable.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImage+Resizable.h"

@implementation UIImage (Resizable)

+ (UIImage *)resizableImage:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}


@end
