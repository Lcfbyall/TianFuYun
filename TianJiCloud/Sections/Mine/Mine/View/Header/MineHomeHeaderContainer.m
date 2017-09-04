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
#define Height  (SCREEN_WIDTH/1.75)
static NSString *identifier = @"MineHeaderCollectionCell";

@interface MineHomeHeaderContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,TJSBaseCollectionViewLayoutDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) MineHomeHeaderCollectionLayout *layout;

@property (nonatomic,strong)TJSPageControl *pageControl;

@end


@implementation MineHomeHeaderContainer

#pragma mark -

+ (instancetype)headerContainer{

    MineHomeHeaderContainer *container = [[MineHomeHeaderContainer alloc]init];
    
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, Height);
    
    container.backgroundColor = ThemeService.weak_color_00;

    return container;
}

- (void)setInteractor:(id<TJSMineHomeInteractor>)interactor{
 
    _interactor = interactor;
    
    _layout = (MineHomeHeaderCollectionLayout *)interactor.headerLayout;
    
    [self p_addSubViews];
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
        
        self.layout.delegate = self;
        self.layout.interMargin = 0;
        self.layout.insets   = UIEdgeInsetsMake(Margin, Margin, Margin, Margin);

        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.interactor.headerLayout];
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
            
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(Height);
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
    
    NSArray *dataSource = [self.interactor.headerDatas firstObject];
    
    return dataSource.count?1:0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     NSArray *dataSource = [self.interactor.headerDatas firstObject];
    return dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MineHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSArray *dataSource = [self.interactor.headerDatas firstObject];
    NSNumber *hide = [self.interactor.headerDatas lastObject];
    [cell tjs_bindDataToCellWithValue:@[dataSource[indexPath.item],hide]];
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
}


#pragma mark - <MineHomeHeaderCollectionLayoutDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView layout:(TJSBaseCollectionViewLayout *)collectionViewLayout{
    
    return  [self numberOfSectionsInCollectionView:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section layout:(TJSBaseCollectionViewLayout *)collectionViewLayout{

    return [self collectionView:collectionView numberOfItemsInSection:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(MineHomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
    

    return self.bounds.size;
    
    return self.collectionView.bounds.size;
    
    return CGSizeMake(SCREEN_WIDTH, Height);
}


#pragma mark - <UIScrollViewDelegate>

//1.将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"1.将要开始拖动");
}


#pragma mark - Public

- (void)p_scrollViewDidScroll:(UIScrollView *)scrollView{
  
    if(scrollView.contentOffset.y < -Height){
        
        CGRect frame     = self.frame;
        frame.size.width = -scrollView.contentOffset.y * 1.75;
        frame.size.height= -scrollView.contentOffset.y;
        frame.origin.x   = (SCREEN_WIDTH - frame.size.width)/2.0;
        frame.origin.y   = scrollView.contentOffset.y;
        self.frame = frame;
    }
}


- (void)tjs_reloadTableHeader{

  [self.collectionView reloadData];

}

@end



