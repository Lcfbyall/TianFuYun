//
//  BankCardAddCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddCellFactory.h"

#import "BankCardAddCellLayoutConfig.h"
#import "TJSBaseTableViewCell.h"
#import "BankCardAddHeaderFooterView.h"


@interface BankCardAddCellFactory ()

@property (nonatomic,strong)BankCardAddCellLayoutConfig *layoutConfig;

@end

@implementation BankCardAddCellFactory

- (instancetype)init{
 
    self = [super init];

    if(self){
    
        _layoutConfig = [[BankCardAddCellLayoutConfig alloc]init];
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

- (CGFloat)cellHeight:(id)model cellWidth:(CGFloat)cellWidth{

    id<TJSBaseCellLayoutConfig> layoutConfig = _layoutConfig;
    CGSize size =  [layoutConfig contentSize:model cellWidth:cellWidth];
    return size.height;
    
}


- (BankCardAddHeaderFooterView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section{

    static NSString *const headerFooterIdentifier = @"BankCardAddHeaderFooterView";
    
    BankCardAddHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    
    if(!header){
        
        [tableView registerClass:[BankCardAddHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
        
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    }
    
    return header;

}



@end
