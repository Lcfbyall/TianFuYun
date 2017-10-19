//
//  WithDrawDepositSumCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositSumCell.h"
#import <BlocksKit/UITextField+BlocksKit.h>
#import <BlocksKit/NSObject+BKBlockObservation.h>

@interface WithDrawDepositSumCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UITextField *sumTextField;

@property (weak, nonatomic) IBOutlet UIButton *allWithDrawBtn;



@end

@implementation WithDrawDepositSumCell

- (void)dealloc{
  
    [_sumTextField bk_removeAllBlockObservers];
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    _titleL.textColor = ThemeService.text_color_01;
    _titleL.font = [UIFont systemFontOfSize:14.0f];
    
    _sumTextField.placeholder = @"0.00";
    _sumTextField.textColor = ThemeService.text_color_00;
    _sumTextField.font = [UIFont systemFontOfSize:22.0f];
    _sumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _sumTextField.leftViewMode = UITextFieldViewModeAlways;
    _sumTextField.leftView = ({
    
        UILabel *left = [[UILabel alloc]init];
        left.text = @"¥";
        left.textColor = ThemeService.text_color_00;
        left.font = [UIFont systemFontOfSize:22.0f];
        left.frame = CGRectMake(0, 0, 20, 30);
        left;
    });
    
    WEAK_SELF(self);
    [_sumTextField addBlockForControlEvents:UIControlEventEditingChanged block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        self.model.sum = ((UITextField *)sender).text;
        
        self.model.itemOperation(nil, nil);
    }];
    
    [_sumTextField bk_addObserverForKeyPath:@"text" task:^(id target) {
        
        STRONG_SELF(self);
        self.model.sum = ((UITextField *)target).text;
        self.model.itemOperation(nil, nil);
        
    }];
    
    _allWithDrawBtn.titleLabel.textColor = ThemeService.main_color_02;
    _allWithDrawBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_allWithDrawBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        STRONG_SELF(self);
        self.sumTextField.text = self.model.total;
    }];
}



#pragma mark - TJSBaseTableViewCellProtocol

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    //self.sumTextField.text = self.model.sum;
    
}


@end
