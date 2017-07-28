//
//  TJSBaseCollectionViewCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseCollectionViewCell.h"

static NSString *_identifier = nil;


@interface TJSBaseCollectionViewCell ()

@end

@implementation TJSBaseCollectionViewCell


+ (void)initialize{
    
    _identifier = NSStringFromClass([self class]);
    
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if(self){
    
    
    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}



#pragma mark - <TJSCollectionViewCellProtocol>

+ (instancetype)tjs_makeCellForAllocCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{

    TJSBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    if(!cell){
      
       [collectionView registerClass:[self class] forCellWithReuseIdentifier:_identifier];
    
        cell =  [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    }
    
    return cell;
}

+ (instancetype)tjs_makeCellForNibCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{

    TJSBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    if(!cell){
        
        NSString *nibName = NSStringFromClass([self class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:nil];
        
    
        [collectionView registerNib:nib forCellWithReuseIdentifier:_identifier];
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    }


    return cell;
}



@end
