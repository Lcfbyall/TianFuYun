//
//  ProductSearchCellContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchCellContentConfigFactory.h"
#import "ProductInfoSearchModel.h"

#import "ProductHotCellContentConfig.h"
#import "ProductSearchCellContentConfig.h"


@interface ProductSearchCellContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation ProductSearchCellContentConfigFactory

- (instancetype)init{
  
    self = [super init];
    
    if(self){
        
        //放入不同种类的内容
        _dict = @{
                  
                  @"ProductSearchHotCell":[ProductHotCellContentConfig new],
                  @"ProductSearchResultCell":[ProductSearchCellContentConfig new],
                  
                  };
    }
    
    return self;
}


#pragma mark - Public

- (NSArray *)allCells{
  
    return  [_dict allKeys];
}

- (id<TJSBaseCellContentConfig>)configBy:(ProductInfoSearchModel *)model{

    if([model isKindOfClass:[ProductInfoSearchModel class]]){
        
        id<TJSBaseCellContentConfig>config = [_dict objectForKey:model.cellClass];
        
        return config;
    }
    
    return nil;
}

@end



