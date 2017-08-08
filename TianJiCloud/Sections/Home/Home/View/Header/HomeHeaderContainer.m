//
//  HomeHeaderContainer.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeHeaderContainer.h"

#import "HomeHeaderCollectionLayout.h"
#import "HomeHeaderCollectionCell.h"

#import "HomeHeaderConfig.h"
#import "HomeWebClickItem.h"
#import "HomeProductClickItem.h"

#import "NSObject+vk_msgSend.h"


#define containerHeight  (SCREEN_WIDTH * 378/414.0)
static NSInteger const Sections = 20;
static CGFloat   const Margin   = 10;
static NSInteger const column   = 4;
static NSString *identifier     = @"HomeHeaderCollectionCell";

@interface HomeHeaderContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,HomeHeaderCollectionLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *webItems;

@property (nonatomic,strong) NSArray *productItems;

@end

@implementation HomeHeaderContainer


#pragma mark - UIView(UIViewHierarchy)

- (void)didMoveToSuperview{

    NSInteger itemRow = Sections/2 * self.webItems.count;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemRow inSection:0];
    
    [self p_scrollToItemAtIndexPath:indexPath];
}

- (void)didMoveToWindow{

}

- (void)didAddSubview:(UIView *)subview{



}


#pragma mark -

+ (instancetype)headerContainer{
  
    HomeHeaderContainer *container = [[HomeHeaderContainer alloc]init];
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, containerHeight + Margin);
    container.backgroundColor = ThemeService.weak_color_00;
    
    container.webItems        = [HomeHeaderConfig webItems];
    
    container.productItems    = [HomeHeaderConfig productHomeItems];
    
    [container p_addCollectionview];
    
    [container p_addProductItems];
    
    return container;
}


#pragma mark - addSubViews

- (void)p_addCollectionview{

    self.collectionView = ({
        
        HomeHeaderCollectionLayout *layout =  [[HomeHeaderCollectionLayout alloc]init];
        layout.delegate = self;
        layout.interMargin = 10;
        layout.insets   = UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
        
        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = ThemeService.main_color_00;
        collectionView.dataSource = self;
        collectionView.delegate   = self;
        //collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator= NO;
        collectionView.showsVerticalScrollIndicator  = NO;
        
        NSString *nibName = NSStringFromClass([HomeHeaderCollectionCell class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
        [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];

        [self addSubview:collectionView];
        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, (self.bounds.size.height - Margin)/2.0 + 10 , 0));
        }];
        
    
        collectionView;
    });
}

- (void)p_addProductItems{
  
    WEAK_SELF(self);
    [self.productItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        STRONG_SELF(self);
        HomeProductClickItem *item = (HomeProductClickItem *)obj;
        CGFloat itemW = self.bounds.size.width/(CGFloat)column;
        CGFloat itemH = (self.bounds.size.height - Margin)/2.0/((CGFloat)self.productItems.count/column);
        CGFloat X     = idx % column * itemW;
        CGFloat Y     = idx / column * itemH + (self.bounds.size.height - Margin)/2.0;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame     = CGRectMake(X, Y, itemW, itemH);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.backgroundColor = ThemeService.main_color_00;
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [btn setImage:IMAGE(item.img) forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitleColor:ThemeService.text_color_01 forState:UIControlStateNormal];

        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            [UIViewController tjs_rootTabBarToProductWithParams:@{@"selectedIndex":@(idx)}];
        }];
        [btn tjs_imageTitleVerticalAlignmentWithSpace:10];
        [self addSubview:btn];
    }];
}


#pragma mark - Private

- (void)p_scrollToItemAtIndexPath:(NSIndexPath *)indexPath{

   [self.collectionView vk_callSelector:@selector(scrollToItemAtIndexPath:atScrollPosition:animated:) error:nil,indexPath,UICollectionViewScrollPositionCenteredHorizontally,NO];
}



#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.webItems.count * Sections;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [cell tjs_bindDataToCellWithValue:(HomeWebClickItem *)self.webItems[indexPath.item%self.webItems.count]];
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSString *targetVC = ((HomeWebClickItem *)self.webItems[indexPath.item % self.webItems.count]).target;
    
    [UIViewController tjs_pushViewController:targetVC params:@{} animated:YES];
}


#pragma mark - <HomeHeaderCollectionLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

    CGFloat height = (self.bounds.size.height - Margin)/2.0 - Margin*2;
    
    return CGSizeMake(300, height);
}


#pragma mark - <UIScrollViewDelegate>

/*
   轻扫一下流程：
 
   1. 将要开始拖动，
   2. 将要停止拖动，也就是手指将要放开
   3. 已经停止拖动，也就是手指已经放开
   4. 将要开始减速，
   5. 已经结束减速，

  拖动一段时时间，放开手指:
 
  1. 将要开始拖动，
  2. 将要停止拖动，也就是手指将要放开
  3. 已经停止拖动，也就是手指已经放开
 
 */

/*
 现在需求是这样：
 
 1. 轻扫一下，要翻页；
 2. 拖动一会再放开，停止后根据位置决定到哪一页
 
 */

//1.将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

   NSLog(@"1.将要开始拖动");
}

//2.将要停止拖动，也就是手指将要放开
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){

    NSLog(@"2.将要停止拖动，也就是手指将要放开");
    
     //向左拖动，去右边
     BOOL left;
     if(velocity.x > 0){
         
       left = NO;
         
     }else if(velocity.x < 0){
         
       left = YES;
         
         
     }else{
     
        //根据位置决定停止在哪个item
         //[_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
     
     }

}

//3.已经停止拖动，也就是手指已经放开
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate{

    NSLog(@"3.已经停止拖动，也就是手指已经放开");
}

//4.将要开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
 
    NSLog(@"4.将要开始减速");
}

//5.已经结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSLog(@"5.已经结束减速");
    
    //[_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

 
//6.停止滑动
// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    NSLog(@"6.停止滑动");
}


@end
