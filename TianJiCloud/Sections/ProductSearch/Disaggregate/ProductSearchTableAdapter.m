//
//  ProductSearchTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchTableAdapter.h"

#import "ProductSearchHotCell.h"
#import "ProductSearchResultCell.h"
#import "ProductSearchHotLayout.h"
#import "ProductSearchResultLayout.h"

#import "TJSProductInfoModel.h"
#import "ProductSearchListCellFactory.h"


static NSString *searchHotCellIdentifier = @"ProductSearchHotCell";
static NSString *searchResultIdentifier = @"ProductSearchResultCell";

@interface ProductSearchTableAdapter ()<TJSBaseCollectionViewLayoutDelegate,ProductSearchHotCellDelegate>

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


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
 
    
    
}


#pragma  mark - <UICollectionViewDataSourcePrefetching>



#pragma mark - <TJSBaseCollectionViewLayoutDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
    
    TJSProductInfoModel *model = [self.interactor.items objectAtIndex:indexPat.item];

    return [self.cellFactory.layoutConfig contentSize:model cellWidth:SCREEN_WIDTH];
    
    return CGSizeMake(100, 40);
}





#pragma mark - <ProductSearchHotCellDelegate>
#pragma mark - <ProductSerachInteractorDelegate>

- (BOOL)onTapCell:(id)value{
  
    //点击热点请求
    
    
    //点击产品结果
    
    
    return YES;
}

@end




