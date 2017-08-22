//
//  SettingHomeCellLayoutConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeCellLayoutConfig.h"

#import "SettingHomeContentConfigFactory.h"

@interface SettingHomeCellLayoutConfig ()

@property (nonatomic,strong)SettingHomeContentConfigFactory *factory;

@end

@implementation SettingHomeCellLayoutConfig

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _factory = [[SettingHomeContentConfigFactory alloc]init];
    }
    
    return self;
}

#pragma mark - <TJSBaseCellLayoutConfig>

- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width{

    id <TJSBaseCellContentConfig> contentConfig = [_factory configBy:model];
    if(contentConfig){
    
       return [contentConfig contentSize:width model:model];
    }
    
    return CGSizeMake(SCREEN_WIDTH, 50);
    
}

- (NSString *)cellContent:(id)model{

    id <TJSBaseCellContentConfig> contentConfig = [_factory configBy:model];
    
    if(contentConfig){
    
        return  [contentConfig cellContent:model];
    }
    
    static NSString *const identifier = @"SettingDefaultTableCell";
    
    return identifier;

}

@end
