//
//  ProductSearchTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchTableAdapter.h"


#import "TJSProductInfoModel.h"
#import "ProductSearchListCellFactory.h"


@interface ProductSearchTableAdapter ()<TJSBaseCollectionViewLayoutDelegate,TJSBaseCollectionViewCellDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic,strong)ProductSearchListCellFactory *cellFactory;

@end


@implementation ProductSearchTableAdapter


- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{

    self = [super init];

    if(self){

        _collectionView = collectionView;
        
        _cellFactory = [[ProductSearchListCellFactory alloc]init];
    }

    return self;
}


//只会赋值一次
- (void)setInteractor:(id<ProductSerachInteractor>)interactor{
  
    _interactor = interactor;
    
    [self registerElementForCollecitonView];
}


- (void)registerElementForCollecitonView{
    
    TJSBaseCollectionViewLayout *layout = (TJSBaseCollectionViewLayout *)self.interactor.collectionViewLayout;
    layout.collectionViewWidth = SCREEN_WIDTH;
    layout.delegate = self;
    
    _collectionView.collectionViewLayout = layout;
  
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
    return self.interactor.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TJSProductInfoModel *model = [self.interactor.items objectAtIndex:indexPath.item];
    TJSBaseCollectionViewCell *cell = [_cellFactory cellInCollectView:collectionView forProductInfoModel:model indexPath:indexPath];
    
    [cell tjs_bindDataToCellWithValue:@""];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    //TJSProductInfoModel *model = [self.interactor.items objectAtIndex:indexPath.item];
    TJSBaseCollectionReusableView *reusable = (TJSBaseCollectionReusableView *)[_cellFactory supplementary:collectionView kind:kind model:nil indexPath:indexPath];

    [reusable tjs_bindDataToCellWithValue:@"热门搜索"];

    return  reusable;

}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
 

}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [scrollView.tjs_viewController.navigationController.navigationBar endEditing:YES];
}


#pragma  mark - <UICollectionViewDataSourcePrefetching>




#pragma mark - <TJSBaseCollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

    /*
    TJSProductInfoModel *model = [self.interactor.items objectAtIndex:indexPat.item];

    return [self.cellFactory.layoutConfig contentSize:model cellWidth:SCREEN_WIDTH];
     */
    
    return CGSizeMake(100 + 10 * indexPat.item, 40);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(collectionViewLayout.collectionViewWidth, 50);
}

#pragma mark - <ProductSearchHotCellDelegate>
#pragma mark - <ProductSerachInteractorDelegate>

- (BOOL)onTapCell:(id)value{
  
    //点击热点请求
    
    
    //点击产品结果
    
    
    return YES;
}

@end




