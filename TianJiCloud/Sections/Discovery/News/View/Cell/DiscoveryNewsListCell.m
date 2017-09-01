//
//  DiscoveryNewsListCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryNewsListCell.h"

@interface DiscoveryNewsListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;

@property (weak, nonatomic) IBOutlet UILabel *newsTitleL;

@property (weak, nonatomic) IBOutlet UILabel *newsTimeL;

@end


@implementation DiscoveryNewsListCell

- (void)awakeFromNib{
  
    [super awakeFromNib];
    
    [self setSubViews];
}

- (void)setSubViews{
  
    _newsImage.image = IMAGE(@"about_commsion_3");

    self.selectedBackgroundView = [UIView new];
    self.selectedBackgroundView.backgroundColor = ThemeService.weak_color_00; 
}


#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    
    
}


/*
 - (void)setHighlighted:(BOOL)highlighted{
     [super setHighlighted:highlighted];
     
     self.userInteractionEnabled = NO;
     [UIView animateWithDuration:0.5 animations:^{
 
         self.contentView.backgroundColor =
     } completion:^(BOOL finished) {
 
         [UIView animateWithDuration:0.5 animations:^{
 
         self.contentView.backgroundColor = 
 
    } completion:^(BOOL finished) {
     
         self.userInteractionEnabled = YES;
         }];
     }];
 }
 */


@end
