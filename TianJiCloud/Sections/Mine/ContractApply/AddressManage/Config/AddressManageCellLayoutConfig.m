//
//  AddressManageCellLayoutConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageCellLayoutConfig.h"

#import "AddressManageContentConfigFactory.h"

@interface AddressManageCellLayoutConfig ()

@property (nonatomic,strong)AddressManageContentConfigFactory *factory;

@end

@implementation AddressManageCellLayoutConfig

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _factory = [[AddressManageContentConfigFactory alloc]init];
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
    
    static NSString *const identifier = @"AddressManageInfoContentConfig";
    
    return identifier;

}

@end
