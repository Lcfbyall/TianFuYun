//
//  ProductListCellHeaderView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListCellHeaderView.h"

@interface ProductListCellHeaderView ()


@end


@implementation ProductListCellHeaderView


#pragma mark - UITableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
  
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
    
        
        [self p_setupSubViews];
    }

    return self;
}


// if the view is reusable (has a reuse identifier), this is called just before the view is returned from the table view method dequeueReusableHeaderFooterViewWithIdentifier:.  If you override, you MUST call super.
- (void)prepareForReuse{
  
    [super prepareForReuse];
    

}

- (void)layoutSubviews{

    [super layoutSubviews];

 
}


#pragma mark - setup

- (void)p_setupSubViews{
  
    self.contentView.backgroundColor = ThemeService.main_color_00;
    self.textLabel.font = [UIFont systemFontOfSize:16.0f];
    self.textLabel.textColor = ThemeService.text_color_01;
    
}


#pragma mark - <TJSTableHeaderFooterViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.textLabel.text = value;
    
    
}



@end



