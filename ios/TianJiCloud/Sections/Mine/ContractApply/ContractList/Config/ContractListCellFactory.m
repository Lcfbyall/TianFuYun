//
//  ContractListCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListCellFactory.h"

#import "TJSBaseTableViewCell.h"

@implementation ContractListCellFactory


+ (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                     forMineInfoModel:(id)model{

    static  NSString * const  _identifier = @"ContractListCell";
    TJSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:_identifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:_identifier];
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return (TJSBaseTableViewCell *)cell;
}


/*
- (UITableViewHeaderFooterView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section{
 
    
    

}
 */

@end
