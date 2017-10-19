//
//  ProductListCellContentView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListCellContentView.h"

#import "TJSProductEvent.h"
#import "TJSProductInfoModel.h"

@implementation ProductListCellContentView

- (instancetype)initListCellContentViewWithDefaultSize:(CGSize)size{

    CGSize defaultSize = size;
    
    self = [self initWithFrame:CGRectMake(0, 0, defaultSize.width, defaultSize.height)];
    
    if (self) {
        
    
    
    }
    return self;
   
}


/**
 *  刷新方法
 *
 *  @param data 刷新数据
 */
- (void)refresh:(TJSProductInfoModel *)data{

    self.model = data;
    
    [self setNeedsLayout];
}

#pragma mark - setters

- (void)setModel:(TJSProductInfoModel *)model{
   
    _model = model;
    
    
    

}


#pragma mark - layoutSubviews

- (void)layoutSubviews{
  
    [super layoutSubviews];

}

- (void)setHighlighted:(BOOL)highlighted{
  
    [super setHighlighted:highlighted];
    
    

}




@end
