//
//  DiscoveryRoadShowListCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryRoadShowListCell.h"
#import "UIImageView+TJSWebCache.h"

@interface DiscoveryRoadShowListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *videoImage;

@property (weak, nonatomic) IBOutlet UILabel *videoTitleL;

@property (weak, nonatomic) IBOutlet UILabel *videoTimeL;

@property (strong, nonatomic) IBOutlet UIButton *playBtn;

@property (nonatomic,strong) DiscoRoadShowInfoModel *model;

@end

@implementation DiscoveryRoadShowListCell

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setSubViews];
}


- (void)setSubViews{
    
    self.selectedBackgroundView = [UIView new];
    self.selectedBackgroundView.backgroundColor = ThemeService.weak_color_00;
    
    self.videoImage.tag = 2017;
    self.videoImage.userInteractionEnabled = YES;
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *btnimg = IMAGE(@"videoPlayBtn");
    [self.playBtn setImage:btnimg forState:UIControlStateNormal];
    WEAK_SELF(self);
    [self.playBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewCellDelegate)] &&
           [self.delegate respondsToSelector:@selector(onTapControl:value:)]){
            [self.delegate onTapControl:sender value:self.model];
        }
    }];
    
    [self.videoImage addSubview:self.playBtn];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(btnimg.size.width);
        make.height.mas_equalTo(btnimg.size.height);
        make.center.equalTo(self.videoImage);
        
    }];
    
}

#pragma mark - <TJSBaseCollectionReusableViewProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
 
    DiscoRoadShowInfoModel *model = (DiscoRoadShowInfoModel *)value;
    self.model = model;
    
    [self.videoImage tjs_setImageWithURL:[NSURL URLWithString:model.showInfo.coverForFeed] placeholderImage:IMAGE(@"about_risk_3")];
    
    
}


#pragma mark - getters

- (NSInteger)videoFatherTag{
  
   return self.videoImage.tag;
}

@end
