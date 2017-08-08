//
//  DiscoveryRoadShowListCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryRoadShowListCell.h"

@interface DiscoveryRoadShowListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *videoImage;

@property (weak, nonatomic) IBOutlet UILabel *videoTitleL;

@property (weak, nonatomic) IBOutlet UILabel *videoTimeL;


@end

@implementation DiscoveryRoadShowListCell

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setSubViews];
}


- (void)setSubViews{

    _videoImage.image = IMAGE(@"about_risk_3");
    
    self.selectedBackgroundView = [UIView new];
    self.selectedBackgroundView.backgroundColor = ThemeService.weak_color_00;
}

@end
