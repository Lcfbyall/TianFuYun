//
//  AddressSelectedDefaultCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedDefaultCell.h"

@interface AddressSelectedDefaultCell ()

@property (weak, nonatomic) IBOutlet UILabel *receiptL;

@property (weak, nonatomic) IBOutlet UILabel *mobileL;

@property (weak, nonatomic) IBOutlet UILabel *addressL;

@property (weak, nonatomic) IBOutlet UIButton *pickBtn;


@end

@implementation AddressSelectedDefaultCell

- (void)awakeFromNib{
    [super awakeFromNib];

    
}

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    
    
    
}

@end
