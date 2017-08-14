//
//  TJSDiscoNewsListAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsListAdapter.h"

#import "DiscoveryNewsInfoModel.h"
#import "DiscoveryNewsListCell.h"
#import "DiscoveryNewsCollectLayout.h"


static NSString *identifier = @"DiscoveryNewsListCell";

@interface TJSDiscoNewsListAdapter ()<TJSBaseCollectionViewLayoutDelegate>

@property (nonatomic,weak)  UICollectionView *collectionView;


@end

@implementation TJSDiscoNewsListAdapter

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{

    self = [super init];
    
    if(self){
    
        _collectionView = collectionView;
        
        
        [self registerElementForCollecitonView];
    }
    
    return self;
}

- (void)registerElementForCollecitonView{
    
    //
    DiscoveryNewsCollectLayout *layout =  [[DiscoveryNewsCollectLayout alloc]init];
    layout.delegate = self;
    
    _collectionView.collectionViewLayout = layout;
    
    //
    NSString *nibName = NSStringFromClass([DiscoveryNewsListCell class]);
    UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];

}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    id<TJSDiscoveryNewsListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DiscoveryNewsInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.item];
    
    DiscoveryNewsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(DiscoveryNewsListCell *)cell setDelegate:self.cellDelegate];

    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DiscoveryNewsListCell *cell = (DiscoveryNewsListCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    DiscoveryNewsInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.item];
    
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
                  layout:(DiscoveryNewsCollectLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

    UIEdgeInsets insets = [self collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPat.section];
    
    CGFloat width = collectionView.bounds.size.width -insets.left-insets.right;
    CGFloat height= width * 5/12.0 + 40;
    
    return CGSizeMake(width,height);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(DiscoveryNewsCollectLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{
  
    return UIEdgeInsetsMake(10, 16, 10, 16);

}


@end




















