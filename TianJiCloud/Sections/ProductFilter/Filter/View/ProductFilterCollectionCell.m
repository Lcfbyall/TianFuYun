//
//  ProductFilterCollectionCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterCollectionCell.h"

@interface ProductFilterCollectionCell ()

@end

@implementation ProductFilterCollectionCell


- (instancetype)initWithFrame:(CGRect)frame{
  
    self = [super initWithFrame:frame];
    if(self){
     
        
        self.contentView.backgroundColor = [UIColor greenColor];
        
    }
    
    return self;
}


#pragma mark - <TJSCollectionViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    
    
}


@end
