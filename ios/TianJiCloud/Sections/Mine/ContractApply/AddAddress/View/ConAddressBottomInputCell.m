//
//  ConAddressBottomInputCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ConAddressBottomInputCell.h"

@interface ConAddressBottomInputCell ()

@property (weak, nonatomic) IBOutlet UILabel *topL;

@property (weak, nonatomic) IBOutlet UITextField *bottomT;


@end

@implementation ConAddressBottomInputCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    WEAK_SELF(self);
    [_bottomT addBlockForControlEvents:UIControlEventEditingChanged block:^(id  _Nonnull sender) {
        
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
    
    self.topL.text = model.leftValue;
    self.bottomT.placeholder = model.rightPlaceHolder;
    self.bottomT.text = model.rightValue;
    self.topL.textColor = model.leftValueColor;
    self.bottomT.textColor = model.rightValueColor;
    self.topL.font = model.leftValueFont;
    self.bottomT.font = model.rightValueFont;
}


@end
