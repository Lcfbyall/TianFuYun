//
//  AddressManageCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageCellFactory.h"

#import "AddressManageCellLayoutConfig.h"

@interface AddressManageCellFactory ()

@property (nonatomic,strong)AddressManageCellLayoutConfig *layoutConfig;

@end

@implementation AddressManageCellFactory

- (instancetype)init{
 
    self = [super init];

    if(self){
    
        _layoutConfig = [[AddressManageCellLayoutConfig alloc]init];
    }
    
    return self;
}

- (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                     forMineInfoModel:(id)model{
 
    id<TJSBaseCellLayoutConfig> layoutConfig = _layoutConfig;
    
    NSString *_identifier = [layoutConfig cellContent:model];
    
    TJSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:_identifier ofType:@"xib"];
        
        if(path){
            
            [tableView registerNib:[UINib nibWithNibName:_identifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:_identifier];
        }else{
            
            [tableView registerClass:NSClassFromString(_identifier) forCellReuseIdentifier:_identifier];
        }
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    return (TJSBaseTableViewCell *)cell;

}

- (CGFloat)cellHeight:(id)model cellWidth:(CGFloat)cellWidth{

    id<TJSBaseCellLayoutConfig> layoutConfig = _layoutConfig;
    CGSize size =  [layoutConfig contentSize:model cellWidth:cellWidth];
    return size.height;
    
}

@end
