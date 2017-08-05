//
//  TJSMineHomeCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeCellFactory.h"
#import "MineHomeBaseTableCell.h"
#import "TJSMineHomeCellLayoutConfig.h"


@implementation TJSMineHomeCellFactory


- (MineHomeBaseTableCell *)cellInTable:(UITableView*)tableView
                      forMineInfoModel:(id)model{

    id<TJSMineHomeCellLayoutConfig> layoutConfig =[TJSMineHomeCellLayoutConfig sharedLayoutConfig];
    
    NSString *_identifier = [layoutConfig cellContent:model];
    MineHomeBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:_identifier ofType:@"xib"];
        
        if(path){
        
           [tableView registerNib:[UINib nibWithNibName:_identifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:_identifier];
        }else{
    
            [tableView registerClass:NSClassFromString(_identifier) forCellReuseIdentifier:_identifier];
        }
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    return (MineHomeBaseTableCell *)cell;

}

@end
