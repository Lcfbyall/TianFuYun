//
//  ProductSearchHotReusableHeader.m
//  TianJiCloud
//
//  Created by staff on 2017/8/12.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchHotReusableHeader.h"

@interface ProductSearchHotReusableHeader ()

@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation ProductSearchHotReusableHeader

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if(self){

        self.backgroundColor = ThemeService.origin_color_00;

        [self p_addSubViews];
    }
    return self;
}


- (void)p_addSubViews{

    self.textLabel = ({

        UILabel *label = [[UILabel alloc]init];
        label.textColor = ThemeService.text_color_00;
        label.font = [UIFont systemFontOfSize:16.0f];

        [self addSubview:label];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, 0, 15));

        }];

        label;
    });
}


#pragma mark - <>

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.textLabel.text = value;
}


@end
