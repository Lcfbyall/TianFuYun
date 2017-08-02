//
//  HomeFooterCollectionCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeFooterCollectionCell.h"

#import "HomeWebClickItem.h"

@interface HomeFooterCollectionCell ()

@property (weak, nonatomic) IBOutlet UIButton *contentBtn;


@end

@implementation HomeFooterCollectionCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
    
    self.contentBtn.titleLabel.numberOfLines = 0;
    
    self.contentBtn.userInteractionEnabled = NO;
    
    self.contentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
}


#pragma mark - <TJSCollectionViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
  
    HomeWebClickItem *item = (HomeWebClickItem *)value;
    
    [self.contentBtn setBackgroundImage:IMAGE(item.imgUrl) forState:UIControlStateNormal];
    
    [self.contentBtn setTitle:item.title forState:UIControlStateNormal];
}




@end
