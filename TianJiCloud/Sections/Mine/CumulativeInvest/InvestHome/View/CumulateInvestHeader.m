//
//  CumulateInvestHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulateInvestHeader.h"

@interface CumulateInvestHeader ()



@end

@implementation CumulateInvestHeader


- (instancetype)init{
    
    self = [super init];
    if(self){
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        
        CGRect frame = CGRectMake(0.0f, 0.0f, screenBounds.size.width, screenBounds.size.width * 666/1240.0);
        
        self.frame = frame;
        
    }
    
    return self;
}



+ (instancetype)header{

    return nil;
}

@end
