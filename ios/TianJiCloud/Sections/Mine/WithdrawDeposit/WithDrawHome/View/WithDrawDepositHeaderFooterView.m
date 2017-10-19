//
//  WithDrawDepositHeaderFooterView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositHeaderFooterView.h"

@implementation WithDrawDepositHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){

        self.contentView.backgroundColor = ThemeService.weak_color_00;

        self.textLabel.font = [UIFont systemFontOfSize:13.0f];
        self.textLabel.textColor = ThemeService.text_color_02;
    }

    return self;
}


- (void)tjs_bindDataToCellWithValue:(id)value{
  
    self.textLabel.text = value;

}


@end
