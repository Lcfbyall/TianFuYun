//
//  ProductSearchHotCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchHotCell.h"

@interface ProductSearchHotCell ()

@property (nonatomic,strong) UIButton *contentBtn;

@end

@implementation ProductSearchHotCell

- (instancetype)initWithFrame:(CGRect)frame{
 
    self = [super initWithFrame:frame];
    
    if(self){
    
        [self p_addSubViews];
    }

    return self;
}


#pragma mark -

- (void)p_addSubViews{
    
    self.contentBtn = ({
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        btn.tjs_titleColorNormal = ThemeService.text_color_01;
        btn.tjs_titleColorHighlighted = ThemeService.origin_color_00;
        btn.tjs_backGroundColorNormal= ThemeService.origin_color_00;
        btn.tjs_backGroundColorHighlighted = ThemeService.main_color_02;
        [self addSubview:btn];
        btn.backgroundColor = [UIColor redColor];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        WEAK_SELF(self);
        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            
            STRONG_SELF(self);
            
            if([self.delegate conformsToProtocol:@protocol(ProductSearchHotCellDelegate)] && [self.delegate respondsToSelector:@selector(onTapCell:)]){
              
                [self.delegate onTapCell:self.indexPath];
            }
        }];
        
        btn;
    });
}


#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
 
    self.contentBtn.tjs_titleNormal = value;
    
}

@end
