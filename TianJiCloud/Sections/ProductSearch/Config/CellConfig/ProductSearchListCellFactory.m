//
//  ProductSearchListCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchListCellFactory.h"
#import "TJSProductInfoModel.h"
#import "TJSBaseCollectionViewCell.h"
#import "TJSBaseCollectionReusableView.h"

@interface ProductSearchListCellFactory ()


@end

@implementation ProductSearchListCellFactory

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _layoutConfig = [[ProductSearchListCellLayoutConfig alloc]init];
    }
    
    return self;
}

- (TJSBaseCollectionViewCell *)cellInCollectView:(UICollectionView *)collectionView
                             forProductInfoModel:(TJSProductInfoModel *)model
                                       indexPath:(NSIndexPath *)indexPath{
 
    id<TJSProductCellLayoutConfig> layoutConfig = _layoutConfig;
    
    NSString *_identifier = [layoutConfig cellContent:model];
    NSString *path = [[NSBundle mainBundle] pathForResource:_identifier ofType:@"xib"];
    if(!path){
    
        [collectionView registerClass:NSClassFromString(_identifier) forCellWithReuseIdentifier:_identifier];
    }else{
       
        [collectionView registerNib:[UINib nibWithNibName:_identifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:_identifier];
    
    }
    
    TJSBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    return cell;

}


- (UICollectionReusableView *)supplementary:(UICollectionView *)collectionView  kind:(NSString *)kind model:(TJSProductInfoModel *)model indexPath:(NSIndexPath *)indexPath{

    TJSBaseCollectionReusableView *reusableView;
   if([kind isEqualToString:UICollectionElementKindSectionHeader]){

       static NSString *const identifier = @"ProductSearchHotReusableHeader";

       [collectionView registerClass:NSClassFromString(identifier) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];

        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];

   }

    return reusableView;
}

@end
