//
//  ContractApplyProductNameCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyProductNameCell.h"

@interface ContractApplyProductNameCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftL;
@property (weak, nonatomic) IBOutlet UITextField *rightT;


@end

@implementation ContractApplyProductNameCell

- (void)awakeFromNib{
  
    [super awakeFromNib];
    
    self.leftL.textColor = ThemeService.text_color_00;
    self.leftL.font = [UIFont systemFontOfSize:14.0f];
    
    self.rightT.textColor = ThemeService.text_color_00;
    self.rightT.font = [UIFont systemFontOfSize:14.0f];
    
    WEAK_SELF(self);
    [_rightT addBlockForControlEvents:UIControlEventEditingChanged block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        self.model.rightValue = ((UITextField *)sender).text;
        
        if(self.valueChangedBlock) self.valueChangedBlock(sender);
    }];
}

#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    ContractInfoApplyModel *model = (ContractInfoApplyModel *)value;
    
    self.leftL.text = model.leftValue;
    self.rightT.text = model.rightValue;
    self.rightT.placeholder = model.rightPlaceHolder;
}


@end
