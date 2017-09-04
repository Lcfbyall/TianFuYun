//
//  ConAddressRightInputCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ConAddressRightInputCell.h"

@interface ConAddressRightInputCell ()

@property (weak, nonatomic) IBOutlet UILabel *lefT;

@property (weak, nonatomic) IBOutlet UITextField *rightT;


@end

@implementation ConAddressRightInputCell

- (void)awakeFromNib{
    [super awakeFromNib];

    WEAK_SELF(self);
    [_rightT addBlockForControlEvents:UIControlEventEditingChanged block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        self.model.rightValue = ((UITextField *)sender).text;
        
        if(self.valueChangedBlock) self.valueChangedBlock(sender);
    }];
    
}

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
  
    [super tjs_bindDataToCellWithValue:value];
    
    ContractAddAddressCellModel *model = (ContractAddAddressCellModel *)value;
    self.model = model;
    
    self.lefT.text = model.leftValue;
    self.rightT.placeholder = model.rightPlaceHolder;
    self.rightT.text = model.rightValue;
    self.lefT.textColor = model.leftValueColor;
    self.rightT.textColor = model.rightValueColor;
    self.lefT.font = model.leftValueFont;
    self.rightT.font = model.rightValueFont;
}


@end
