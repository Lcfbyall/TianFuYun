//
//  ConAddressMiddleLabelCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ConAddressMiddleLabelCell.h"

@interface ConAddressMiddleLabelCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftL;

@property (weak, nonatomic) IBOutlet UILabel *rightL;


@end

@implementation ConAddressMiddleLabelCell

- (void)awakeFromNib{
    [super awakeFromNib];
    

}

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    ContractAddAddressCellModel *model = (ContractAddAddressCellModel *)value;
    self.model = model;
    
    self.leftL.text = model.leftValue;
    self.rightL.text = model.rightValue;
    self.leftL.textColor = model.leftValueColor;
    self.rightL.textColor = model.rightValueColor;
    self.leftL.font = model.leftValueFont;
    self.rightL.font = model.rightValueFont;
}


@end
