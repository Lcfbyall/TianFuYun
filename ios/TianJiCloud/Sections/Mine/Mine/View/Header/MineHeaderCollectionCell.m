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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstant;


@end


@implementation MineHeaderCollectionCell

- (void)awakeFromNib{
  
    [super awakeFromNib];

    self.contentView.backgroundColor = ThemeService.main_color_04;
    self.backgroundView = [UIView new];
    
    self.titleL.font = [UIFont systemFontOfSize:14.0f];
    self.titleL.textColor = ThemeService.main_color_00;
    
    self.moneyL.font = [UIFont boldSystemFontOfSize:25.0f];
    self.moneyL.textColor = UIColorFromHEX(0xfeef5d);
    
}


- (void)updateConstraints{

    [self removeConstraint:_bottomConstant];

    NSLayoutConstraint *myConstraint =
    [NSLayoutConstraint
        constraintWithItem:_moneyL
        attribute:NSLayoutAttributeBottom
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeBottom
        multiplier:1.0
        constant:-(SCREEN_WIDTH/1.75/2.0-30)];
    
    [self addConstraint: myConstraint];
    
    [super updateConstraints];
}


#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    NSArray *datas = [(NSArray *)value firstObject];
    
    self.titleL.text = [datas firstObject];
    
    self.moneyL.text = [[value lastObject] boolValue]?@"****":[datas lastObject];
}



@end



