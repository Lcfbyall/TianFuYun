//
//  ProductFilterReusableSectionHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterReusableSectionHeader.h"

@implementation ProductFilterReusableSectionHeader

- (instancetype)initWithFrame:(CGRect)frame{
  
    self = [super initWithFrame:frame];
    
    if(self){
     
        self.backgroundColor = [UIColor blueColor];
      
    }
    return self;
}

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


}


@end
