//
//  MineHeaderCollectionCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHeaderCollectionCell.h"

@interface MineHeaderCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *moneyL;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moneyTopConstraint;


@end

@implementation MineHeaderCollectionCell

- (void)awakeFromNib{
  
    [super awakeFromNib];

    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.titleL.font = [UIFont systemFontOfSize:14.0f];
    self.titleL.textColor = [UIColor whiteColor];
    
    self.moneyL.font = [UIFont boldSystemFontOfSize:20.0f];
    self.moneyL.textColor = [UIColor yellowColor];
    
}

@end
