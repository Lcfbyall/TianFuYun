//
//  ProductDetailFooter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductDetailFooter.h"

@implementation ProductDetailFooter

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        
        CGFloat height = screenBounds.size.width * 1032/1242.0;
        CGRect frame = CGRectMake(0.0f, -height, screenBounds.size.width, height);
        
        self.frame = frame;
    }
    
    return self;
}


+ (instancetype)footerWithDone:(void (^)(NSInteger index))done{

    ProductDetailFooter *footer = [[self alloc]init];

    
    return footer;
}



@end
