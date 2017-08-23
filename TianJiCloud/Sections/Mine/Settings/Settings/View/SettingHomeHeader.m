//
//  SettingHomeHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/23.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeHeader.h"

@interface SettingHomeHeader ()



@end

@implementation SettingHomeHeader

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


+ (instancetype)header{

    SettingHomeHeader *header = [[self alloc]init];
    header.backgroundColor = [UIColor redColor];
    
    return header;
}


@end
