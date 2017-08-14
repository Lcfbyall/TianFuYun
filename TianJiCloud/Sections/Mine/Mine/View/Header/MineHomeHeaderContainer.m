//
//  MineHomeHeaderContainer.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeHeaderContainer.h"
#import "MineHomeHeaderCollectionLayout.h"
#import "MineHeaderCollectionCell.h"
#import "TJSPageControl.h"


static CGFloat const Margin = 0;
static NSString *identifier = @"MineHeaderCollectionCell";

@interface MineHomeHeaderContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,TJSBaseCollectionViewLayoutDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong)TJSPageControl *pageControl;

@end


@implementation MineHomeHeaderContainer

#pragma mark -

+ (instancetype)headerContainer{

    MineHomeHeaderContainer *container = [[MineHomeHeaderContainer alloc]init];
    
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/1.75);
    container.backgroundColor = ThemeService.weak_color_00;
   
    [container p_addSubViews];

    return container;
}


#pragma mark - addSubViews

- (void)p_addSubViews{
    
    
    self.bgImageView    = ({
     
        UIImageView *bgImgView = [[UIImageView alloc]initWithImage:IMAGE(@"tradingHeadBg")];
        
        [self addSubview:bgImgView];
        
        [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0 , 0));
        }];
        
        bgImgView;
    
    });
  
    self.collectionView = ({
        
        MineHomeHeaderCollectionLayout *layout =  [[MineHomeHeaderCollectionLayout alloc]init];
        layout.delegate = self;
        layout.interMargin = 0;
        layout.insets   = UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
        
        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.dataSource = self;
        collectionView.delegate   = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator= NO;
        collectionView.showsVerticalScrollIndicator  = NO;
        
        //registerNib
        NSString *nibName = NSStringFromClass([MineHeaderCollectionCell class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
        [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
        [self addSubview:collectionView];
    
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0 , 0));
        }];
        
        collectionView;
    });
    
    
    self.pageControl = ({
    
        TJSPageControl *page = [[TJSPageControl alloc]init];
        
        
        [self addSubview: page];
        
        [page mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            
        }];
    
        page;
        
    });
    
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MineHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    
    [cell tjs_bindDataToCellWithValue:nil];
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
}


#pragma mark - <MineHomeHeaderCollectionLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(MineHomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
    
    
    return self.collectionView.bounds.size;
}


#pragma mark - <UIScrollViewDelegate>

//1.将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"1.将要开始拖动");
}



@end



