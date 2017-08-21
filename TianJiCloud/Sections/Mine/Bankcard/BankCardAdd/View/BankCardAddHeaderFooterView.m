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

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        
        self.contentView.backgroundColor = ThemeService.weak_color_00;

        self.textLabel.font = [UIFont systemFontOfSize:13.0f];
        self.textLabel.textColor = ThemeService.text_color_02;
    }
    
    return self;
}

// if the view is reusable (has a reuse identifier), this is called just before the view is returned from the table view method dequeueReusableHeaderFooterViewWithIdentifier:.  If you override, you MUST call super.
- (void)prepareForReuse{
    
    [super prepareForReuse];
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //self.textLabel.tjs_left = 15;
}


#pragma mark - <TJSBaseTableHeaderFooterViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
   
    self.textLabel.text = value;
}
@end
