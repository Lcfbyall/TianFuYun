//
//  ProductListCellContentView.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListCellTextContentView.h"

@implementation ProductListCellTextContentView



#pragma mark -  ProductListCellContentView

- (instancetype)initListCellContentViewWithDefaultSize:(CGSize)size{
  
    self = [super initListCellContentViewWithDefaultSize:size];
    
    if(self){
    
        [self setupSubViews];
        
        
        self.backgroundColor= [UIColor redColor];
    
    }

    return self;
}

- (void)refresh:(TJSProductInfoModel *)data{
   
    [super refresh:data];
    
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    [super touchesBegan:touches withEvent:event];

}



#pragma mark - subViews

- (void)setupSubViews{

  
}



- (void)layoutSubviews{
    [super layoutSubviews];

    
    
}

@end
