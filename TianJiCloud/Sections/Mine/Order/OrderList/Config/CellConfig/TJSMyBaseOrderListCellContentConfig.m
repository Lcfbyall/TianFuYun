//
//  TJSMyBaseOrderListCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyBaseOrderListCellContentConfig.h"
#import "TJSMyOrderListCellContentConfig.h"


@interface TJSMyOrderListCellContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;


@end

@implementation TJSMyOrderListCellContentConfigFactory

+ (instancetype)sharedFacotry{

    static TJSMyOrderListCellContentConfigFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[TJSMyOrderListCellContentConfigFactory alloc] init];
    });
    return instance;

}

- (instancetype)init
{
    if (self = [super init])
    {
        
        //放入不同种类的内容
        _dict = @{
                  
                  @"MyOrderListTableCell":[TJSMyOrderListCellContentConfig new],
                
                  };
    }
    
    return self;
}



- (id<TJSMyOrderListCellContentConfig>)configBy:(id)model{

    //根据order的类型

    id<TJSMyOrderListCellContentConfig>config = [_dict objectForKey:@"MyOrderListTableCell"];
    
    return config;
}


@end
