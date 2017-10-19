//
//  TJSBaseProductListContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseProductListContentConfig.h"

//类工厂模式,因为产品是首页，下个版本很可能有这个需求
//如果产品列表后续有多种样式的产品cell，导入各种样式的contentConfig
#import "TJSProductListContentConfig.h"
#import "TJSProductListTextContentConfig.h"
#import "TJSProductListImageContentConfig.h"



@interface TJSProductListContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end

@implementation TJSProductListContentConfigFactory

+ (instancetype)sharedFacotry
{
    static TJSProductListContentConfigFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TJSProductListContentConfigFactory alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
         //暂时只有一种cell，放入不同种类的内容
        _dict = @{
                  
        

                 };
    }
    
    return self;
}


- (id<TJSProductListContentConfig>)configBy:(TJSProductInfo *)product
{
    
    return nil;
}





@end




