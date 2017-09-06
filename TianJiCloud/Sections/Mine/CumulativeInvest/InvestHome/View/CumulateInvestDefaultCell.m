//
//  CumulateInvestDefaultCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulateInvestDefaultCell.h"

@implementation CumulateInvestDefaultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
 
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    
    if(self){
    
        
        self.selectedBackgroundView = [UIView new];
        
    }

    return self;
}

- (void)tjs_bindDataToCellWithValue:(id)value{
 
    CumulateInvestInfoModel *model = (CumulateInvestInfoModel *)value;
    
    self.backgroundView = nil;
    self.backgroundColor = model.cellBgColor;
    self.contentView.backgroundColor = model.cellBgColor;
    self.selectedBackgroundView.backgroundColor = model.cellSelectedColor;
    self.accessoryType = model.accessoryType;
    self.selectionStyle = model.selectionStyle;
    
    self.textLabel.text = model.text;
    self.textLabel.textColor = model.textColor;
    self.textLabel.highlightedTextColor = model.highlightedTextColor;
    
    self.detailTextLabel.text = model.detailText;
    self.detailTextLabel.textColor = model.detailTextColor;
    self.detailTextLabel.highlightedTextColor= model.highlightedDetailTextColor;
}


@end
