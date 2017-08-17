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
    TJSMyOrderListCellLayoutConfig *instance = nil;
   
    instance = [[TJSMyOrderListCellLayoutConfig alloc] init];
    
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
    
    static NSString *const identifier = @"MyOrderListTableCell";
    
    return identifier;

}



@end
