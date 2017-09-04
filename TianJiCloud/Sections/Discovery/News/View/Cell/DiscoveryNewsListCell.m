//
//  DiscoveryNewsListCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryNewsListCell.h"
#import "UIImageView+TJSWebCache.h"

@interface DiscoveryNewsListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;

@property (weak, nonatomic) IBOutlet UILabel *newsTitleL;

@property (weak, nonatomic) IBOutlet UILabel *newsTimeL;

@property (nonatomic,strong) DiscoveryNewsInfoModel *model;

@end


@implementation DiscoveryNewsListCell

- (void)awakeFromNib{
  
    [super awakeFromNib];
    
    [self setSubViews];
}

- (void)setSubViews{
  
    self.selectedBackgroundView = [UIView new];
    self.selectedBackgroundView.backgroundColor = ThemeService.weak_color_00;

    self.newsImage.contentMode = UIViewContentModeScaleAspectFill;

    self.newsTitleL.textColor = ThemeService.origin_color_00;
    self.newsTitleL.font = [UIFont systemFontOfSize:13.0f];
    
    self.newsTimeL.textColor = ThemeService.origin_color_00;
    self.newsTimeL.font = [UIFont systemFontOfSize:13.0f];
    
}


#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    DiscoveryNewsInfoModel *model = (DiscoveryNewsInfoModel * )value;
    self.model = model;
    
    [self.newsImage tjs_setImageWithURL:[NSURL URLWithString:model.newsInfo.coverForFeed ]placeholderImage:IMAGE(@"about_commsion_3")];
    
    self.newsTitleL.text = model.newsInfo.title;
    
//    self.newsTitleL.text = 
    
}


- (void)layoutSubviews{
    [super layoutSubviews];

 
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
