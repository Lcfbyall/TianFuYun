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


static CGFloat const Margin = 10;
static CGFloat const CollectHeight = 115;

static NSString *identifier = @"HomeFooterCollectionCell";

@interface HomeFooterContainer ()<UICollectionViewDataSource,UICollectionViewDelegate,HomeFooterCollectionLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation HomeFooterContainer

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
         [self addCollectionview];
    }
    
    return self;
}


+ (instancetype)footerContainer{
 
    HomeFooterContainer *container = [[HomeFooterContainer alloc]init];
    
    container.frame = CGRectMake(0, 0, SCREEN_WIDTH, CollectHeight + Margin * 2);
    
    container.backgroundColor = [UIColor greenColor];
    
    return container;
}

- (void)addCollectionview{
    
    self.collectionView = ({
        
        HomeFooterCollectionLayout *layout =  [[HomeFooterCollectionLayout alloc]init];
        
        layout.delegate = self;
        layout.insets   = UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
        
        UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        
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

    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    HomeFooterCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    

}


#pragma mark - <HomeFooterCollectionLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeFooterCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
 
    return CGSizeMake(175, 95);

}



@end
