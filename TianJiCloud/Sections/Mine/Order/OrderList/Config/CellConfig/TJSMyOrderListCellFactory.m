//
//  TJSMyOrderListCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListCellFactory.h"

#import "TJSBaseTableViewCell.h"
#import "TJSMyOrderListCellLayoutConfig.h"

@implementation TJSMyOrderListCellFactory


- (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                     forOrderInfoModel:(id)model{

    id<TJSMyOrderListCellLayoutConfig> layoutConfig =[TJSMyOrderListCellLayoutConfig sharedLayoutConfig];
    
    NSString *_identifier = [layoutConfig cellContent:model];
    
    TJSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:_identifier ofType:@"xib"];
        
        if(!path) path = [[NSBundle mainBundle] pathForResource:_identifier ofType:@"nib"];
        
        if(path){
            
            [tableView registerNib:[UINib nibWithNibName:_identifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:_identifier];
        }else{
            
            [tableView registerClass:NSClassFromString(_identifier) forCellReuseIdentifier:_identifier];
        }
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    return (TJSBaseTableViewCell *)cell;
}

@end
