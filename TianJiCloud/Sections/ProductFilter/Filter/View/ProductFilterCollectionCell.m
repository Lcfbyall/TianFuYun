//
//  ProductFilterCollectionCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterCollectionCell.h"
#import "ProductFilterItem.h"

@interface ProductFilterCollectionCell ()

@property (nonatomic,strong) UIButton *contentBtn;


@end

@implementation ProductFilterCollectionCell


- (instancetype)initWithFrame:(CGRect)frame{
  
    self = [super initWithFrame:frame];
    if(self){
     
        
        self.contentView.backgroundColor = [UIColor greenColor];
        [self p_addSubViews];
    }
    
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    
}

- (void)p_addSubViews{
    
    self.contentBtn = ({
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        
        btn.tjs_titleColorNormal = ThemeService.text_color_01;
        btn.tjs_titleColorSelected= ThemeService.origin_color_00;
        btn.tjs_backGroundColorNormal= ThemeService.weak_color_00;
        btn.tjs_backGroundColorSelected = ThemeService.main_color_02;
        btn.tjs_backGroundColorNormal = ThemeService.origin_color_00;
        btn.tjs_backGroundColorSelected = ThemeService.main_color_02;
        
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
            
        }];
        
        
        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            
            ((UIButton *)sender).selected = !((UIButton *)sender).selected;
            
        }];
        
        btn;
    });
}

#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    self.contentBtn.tjs_titleNormal = ((ProductFilterItem *)value).title;
 
    
    
    
}


@end
