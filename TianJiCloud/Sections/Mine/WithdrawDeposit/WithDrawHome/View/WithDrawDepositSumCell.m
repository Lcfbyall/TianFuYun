//
//  WithDrawDepositSumCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositSumCell.h"

@interface WithDrawDepositSumCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UITextField *sumTextField;

@property (weak, nonatomic) IBOutlet UIButton *allWithDrawBtn;



@end

@implementation WithDrawDepositSumCell

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    _titleL.textColor = ThemeService.text_color_01;
    _titleL.font = [UIFont systemFontOfSize:14.0f];
    
    _sumTextField.placeholder = @"0.00";
    _sumTextField.textColor = ThemeService.text_color_00;
    _sumTextField.font = [UIFont systemFontOfSize:22.0f];
    _sumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _allWithDrawBtn.titleLabel.textColor = ThemeService.main_color_02;
    _allWithDrawBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_allWithDrawBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        
    }];
}



#pragma mark - TJSBaseTableViewCellProtocol

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    
    
}


@end
