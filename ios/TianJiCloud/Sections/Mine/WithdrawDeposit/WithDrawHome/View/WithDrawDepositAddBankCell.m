//
//  WithDrawDepositAddBankCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositAddBankCell.h"

@interface WithDrawDepositAddBankCell ()

@property (weak, nonatomic) IBOutlet UILabel *addTitleL;


@end

@implementation WithDrawDepositAddBankCell

- (void)awakeFromNib{
  
    [super awakeFromNib];
    
    _addTitleL.textColor = ThemeService.text_color_02;
    _addTitleL.font = [UIFont systemFontOfSize:14.0f];
   
}

#pragma mark - TJSBaseTableViewCellProtocol

- (void)tjs_bindDataToCellWithValue:(id)value{
    
     [super tjs_bindDataToCellWithValue:value];
    
    
    
}



@end
