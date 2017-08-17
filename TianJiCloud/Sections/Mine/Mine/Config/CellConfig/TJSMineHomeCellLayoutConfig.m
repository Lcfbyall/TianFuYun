//
//  TJSMineHomeCellLayoutConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeCellLayoutConfig.h"

#import "TJSBaseMineHomeCellContentConfig.h"

@interface TJSMineHomeCellLayoutConfig ()

@end

@implementation TJSMineHomeCellLayoutConfig


+ (instancetype)sharedLayoutConfig
{
    static TJSMineHomeCellLayoutConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TJSMineHomeCellLayoutConfig alloc] init];
    });
    return instance;
}


#pragma mark - <TJSMineHomeCellLayoutConfig>

- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width{

    id<TJSMineHomeCellContentConfig> config = [[TJSMineHomeCellContentConfigFactory sharedFacotry] configBy:model];
    
    if(config){
        
        return [config contentSize:width model:model];
    }
    
    return CGSizeMake(SCREEN_WIDTH, 50);
}


- (NSString *)cellContent:(id)model{

    id<TJSMineHomeCellContentConfig> config = [[TJSMineHomeCellContentConfigFactory sharedFacotry] configBy:model];
    
    if(config){
    
        return [config cellContent:model];
    }
    
    static NSString *const identifier = @"MineHomeDefaultCell";
    
    return identifier;

}




@end
