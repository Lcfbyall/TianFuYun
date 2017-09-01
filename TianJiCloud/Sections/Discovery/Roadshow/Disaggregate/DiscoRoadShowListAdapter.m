//
//  DiscoRoadShowListAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowListAdapter.h"

#import "DiscoRoadShowInfoModel.h"
#import "DiscoveryRoadShowLayout.h"
#import "DiscoveryRoadShowListCell.h"


static NSString *identifier = @"DiscoveryRoadShowListCell";

@interface DiscoRoadShowListAdapter ()<TJSBaseCollectionViewLayoutDelegate>

@property (nonatomic,weak)  UICollectionView *collectionView;


@end

@implementation DiscoRoadShowListAdapter

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{

    self = [super init];
    
    if(self){
    
        _collectionView = collectionView;
    
    }
    
    return self;
}


//只会赋值一次
- (void)setInteractor:(id<DiscoRoadShowListInteractor>)interactor{
    
    _interactor = interactor;
    
    [self registerElementForCollecitonView];
}

- (void)registerElementForCollecitonView{
    
    //
    DiscoveryRoadShowLayout *layout =  (DiscoveryRoadShowLayout *)self.interactor.collectionViewLayout;
    layout.collectionViewWidth = SCREEN_WIDTH;
    layout.delegate = self;
    
    _collectionView.collectionViewLayout = layout;
    
    //
    NSString *nibName = NSStringFromClass([DiscoveryRoadShowListCell class]);
    UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];

}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    id<DiscoRoadShowListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DiscoRoadShowInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.item];
    
    DiscoveryRoadShowListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(DiscoveryRoadShowListCell *)cell setDelegate:self.cellDelegate];
    model.scrollView       = collectionView;
    model.indexPath        = indexPath;
    model.fatherViewTag    = cell.videoFatherTag;
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DiscoveryRoadShowListCell *cell = (DiscoveryRoadShowListCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    DiscoRoadShowInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.item];
    
    [cell.delegate onTapCell:model];

}


#pragma mark - <TJSBaseCollectionViewLayoutDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout{
    
    return  [self numberOfSectionsInCollectionView:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section layout:(TJSBaseCollectionViewLayout *)collectionViewLayout{
    
    return [self collectionView:collectionView numberOfItemsInSection:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(DiscoveryRoadShowLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

    UIEdgeInsets insets = [self collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPat.section];
    
    CGFloat width = collectionView.bounds.size.width -insets.left-insets.right;
    CGFloat height= width * 5/12.0 + 40;
    
    return CGSizeMake(width,height);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(DiscoveryRoadShowLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{
  
    return UIEdgeInsetsMake(10, 16, 10, 16);

}


@end




















