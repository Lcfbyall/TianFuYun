//
//  MineHomeBalanceCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBalanceCell.h"

@interface MineHomeBalanceCell ()



@end

@implementation MineHomeBalanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
    }
    
    return self;
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];
    
    self.detailTextLabel.text = nil;
    
    //添加一个按钮
    
    
    
    
}

@end
