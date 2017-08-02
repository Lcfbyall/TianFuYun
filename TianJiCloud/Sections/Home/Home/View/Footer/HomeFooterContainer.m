//
//  HomeFooterContainer.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeFooterContainer.h"

#import "HomeFooterCollectionLayout.h"
#import "HomeFooterCollectionCell.h"
#import "HomeFooterConfig.h"
#import "HomeWebClickItem.h"

static CGFloat const Margin = 10;
static CGFloat const CollectHeight = 115;

static NSString *identifier = @"HomeFooterCollectionCell";

@interface HomeFooterContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,HomeFooterCollectionLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *items;

@end

@implementation HomeFooterContainer

+ (instancetype)footerContainer{
 
    HomeFooterContainer *container = [[HomeFooterContainer alloc]init];
    
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, CollectHeight + Margin * 2);
    
    container.backgroundColor = ThemeService.weak_color_10;
    
    [container addCollectionview];
    
    container.items = [HomeFooterConfig items];
    
    return container;
}

- (void)addCollectionview{
    
    self.collectionView = ({
        
        HomeFooterCollectionLayout *layout =  [[HomeFooterCollectionLayout alloc]init];
        
        layout.delegate = self;
        layout.interMargin = 10;
        layout.insets   = UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
        
        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor    = [UIColor whiteColor];
        collectionView.dataSource         = self;
        collectionView.delegate           = self;
        collectionView.showsHorizontalScrollIndicator= NO;
        collectionView.showsVerticalScrollIndicator  = NO;
        
        
        NSString *nibName = NSStringFromClass([HomeFooterCollectionCell class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
        [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
        
        [self addSubview:collectionView];
        
  
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(Margin, 0, Margin, 0));
        }];
        
        collectionView;
    });
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HomeFooterCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [cell tjs_bindDataToCellWithValue:(HomeWebClickItem*)self.items[indexPath.item]];
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSString *targetVC = ((HomeWebClickItem *)self.items[indexPath.item]).target;
    
    [UIViewController tjs_pushViewController:targetVC params:@{} animated:YES];

}


#pragma mark - <HomeFooterCollectionLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeFooterCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
 
    return CGSizeMake(175, 95);

}

@end
