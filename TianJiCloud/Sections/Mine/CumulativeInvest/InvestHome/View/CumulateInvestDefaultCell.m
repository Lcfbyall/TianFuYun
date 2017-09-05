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
    
    }

    return self;
}

- (void)tjs_bindDataToCellWithValue:(id)value{
 
    CumulateInvestInfoModel *model = (CumulateInvestInfoModel *)value;
    
    self.textLabel.text = model.text;
    self.detailTextLabel.text = model.detailText;
    
    
}


@end
