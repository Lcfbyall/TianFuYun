//
//  TJSMyOrderListCellLayoutConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListCellLayoutConfig.h"
#import "TJSMyBaseOrderListCellContentConfig.h"

@implementation TJSMyOrderListCellLayoutConfig


+ (instancetype)sharedLayoutConfig
{
    static TJSMyOrderListCellLayoutConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TJSMyOrderListCellLayoutConfig alloc] init];
    });
    return instance;
}


#pragma mark - <TJSMyOrderListCellLayoutConfig>


/**
 * @return 返回message的内容大小
 */
- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width{

    id<TJSMyOrderListCellContentConfig> config = [[TJSMyOrderListCellContentConfigFactory sharedFacotry] configBy:model];
    
    if(config){
        
        return [config contentSize:width model:model];
    }
    
    return CGSizeMake(width, 180);

}


/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(id)model{

    id<TJSMyOrderListCellContentConfig> config = [[TJSMyOrderListCellContentConfigFactory sharedFacotry] configBy:model];
    
    if(config){
        
        return [config cellContent:model];
    }
    
    return  @"MyOrderListTableCell";

}



@end
