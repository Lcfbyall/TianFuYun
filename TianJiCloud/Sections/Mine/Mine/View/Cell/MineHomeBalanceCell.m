//
//  MineHomeBalanceCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBalanceCell.h"

@interface MineHomeBalanceCell ()

@property (nonatomic,strong) UIButton *withdarwBtn;

@end

@implementation MineHomeBalanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){


        [self p_addSubView];
        
    }
    
    return self;
}


- (void)p_addSubView{

    self.withdarwBtn = ({
        UIColor *tintcolor = ThemeService.main_color_02;
        CGFloat cornerRadius = 15;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius  = cornerRadius;
        button.layer.borderColor   = tintcolor.CGColor;
        button.layer.borderWidth   = 1;
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitle:@"提现" forState:UIControlStateNormal];
        [button setTitleColor:tintcolor forState:UIControlStateNormal];
        [button setTitleColor:ThemeService.origin_color_00 forState:UIControlStateHighlighted];
        [button setBackgroundColor:ThemeService.main_color_02 forState:UIControlStateHighlighted];
        [button addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            if(self.cellInfo.itemOperation)self.cellInfo.itemOperation(nil, nil);
        }];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(cornerRadius*2);
            //make.trailing.mas_equalTo(-15);
            make.right.mas_equalTo(-15);
            //make.centerYWithinMargins.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
        button;
    });
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    self.detailTextLabel.text = nil;
 
    
    
}





@end
