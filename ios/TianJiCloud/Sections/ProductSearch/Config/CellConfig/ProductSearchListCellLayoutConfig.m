//
//  ProductSearchListCellLayoutConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchListCellLayoutConfig.h"
#import "ProductSearchCellContentConfigFactory.h"
#import "ProductInfoSearchModel.h"

@interface ProductSearchListCellLayoutConfig ()

@property (nonatomic,strong)ProductSearchCellContentConfigFactory *contentFactory;

@end

@implementation ProductSearchListCellLayoutConfig

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _contentFactory = [[ProductSearchCellContentConfigFactory alloc]init];
    }
    
    return self;
}



#pragma mark - <TJSProductCellLayoutConfig>

/**
 * @return 返回的内容大小
 */
- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width{

    //
    id<TJSBaseCellContentConfig> config =
    [self.contentFactory configBy:model];
    
    if(config){
      
        return [config contentSize:width model:model];
    }
    
    return CGSizeMake(100, 40);
}


/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(id)model{

    //
    id<TJSBaseCellContentConfig> config =
    [self.contentFactory configBy:model];
    
    if(config){
        
        return [config cellContent:model];
    }

    return @"ProductSearchHotCell";
}

- (NSArray *)allCells{
  
   return  [self.contentFactory allCells];
}


@end
