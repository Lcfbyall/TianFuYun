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


static CGFloat const Margin = 10;

static NSString *identifier = @"HomeHeaderCollectionCell";

@interface HomeHeaderContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,HomeHeaderCollectionLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation HomeHeaderContainer

- (instancetype)initWithFrame:(CGRect)frame{
  
    self = [super initWithFrame:frame];
    if(self){
    
        
        [self addCollectionview];
    }
    
    return self;
}


+ (instancetype)headerContainer{
  
    HomeHeaderContainer *container = [[HomeHeaderContainer alloc]init];
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 378/414.0 + Margin * 2);
    container.backgroundColor = [UIColor redColor];
    
    return container;

}


- (void)addCollectionview{

    self.collectionView = ({
        
        
        HomeHeaderCollectionLayout *layout =  [[HomeHeaderCollectionLayout alloc]init];
        
        

        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        
        NSString *nibName = NSStringFromClass([HomeHeaderCollectionCell class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
        [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
        
        [self addSubview:collectionView];

        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 0, 10, 0));
        }];
        
    
        collectionView;
    });
    

}




#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HomeHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
    
}


#pragma mark - <HomeHeaderCollectionLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

    return CGSizeMake(200, 100);
}


@end
