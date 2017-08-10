//
//  ProductFilterReusableSectionHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterReusableSectionHeader.h"

@interface ProductFilterReusableSectionHeader ()

@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation ProductFilterReusableSectionHeader

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


#pragma mark - UICollectionReusableView

- (void)prepareForReuse{
    [super prepareForReuse];
    
    
}

/*
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{


}

// Override these methods to provide custom UI for specific layouts.
- (void)willTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout{

}

- (void)didTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout{

}


- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes NS_AVAILABLE_IOS(8_0){

}
*/

#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.textLabel.text = value;

}


@end
