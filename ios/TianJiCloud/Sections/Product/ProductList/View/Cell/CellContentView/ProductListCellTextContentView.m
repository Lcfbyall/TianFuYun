//
//  ProductListCellContentView.m
//  TianJiCloud
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
        
        self.backgroundColor= ThemeService.main_color_00;
    }

    return self;
}


#pragma mark - subViews

- (void)setupSubViews{

  
}



@end
