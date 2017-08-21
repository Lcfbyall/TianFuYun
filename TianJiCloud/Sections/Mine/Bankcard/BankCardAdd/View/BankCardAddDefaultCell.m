//
//  BankCardAddDefaultCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddDefaultCell.h"

@interface BankCardAddDefaultCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation BankCardAddDefaultCell

- (void)awakeFromNib{
  
    [super awakeFromNib];
    
    WEAK_SELF(self);
    [_textField addBlockForControlEvents:UIControlEventEditingChanged block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        self.model.titleValue = ((UITextField *)sender).text;
        
        if(self.valueChangedBlock) self.valueChangedBlock(sender);
    }];
}


#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    [super tjs_bindDataToCellWithValue:value];
    

    BankCardAddCellInfoModel *model = (BankCardAddCellInfoModel *)value;
    _titleL.text = model.title;
    _textField.placeholder = model.placeHolder;
    _textField.text = model.titleValue;
    _textField.enabled = model.canInput;
    _textField.keyboardType = model.keyboardType;
}

@end
