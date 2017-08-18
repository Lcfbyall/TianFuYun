//
//  BankCardAddHeaderFooterView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddHeaderFooterView.h"

@interface BankCardAddHeaderFooterView ()


@end

@implementation BankCardAddHeaderFooterView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
    
        [self p_setupSubViews];
    }
    
    return self;
}

- (void)awakeFromNib{
  
    [super awakeFromNib];

    [self p_setupSubViews];
}


- (void)p_setupSubViews{
  
    
}


#pragma mark - <TJSBaseTableHeaderFooterViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
   
    self.textLabel.text = value;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = ThemeService.text_color_02;
    
    self.contentView.backgroundColor = ThemeService.weak_color_00;
}

@end
