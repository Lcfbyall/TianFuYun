//
//  WithDrawDepositCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositCellFactory.h"

#import "WithDrawDepositCellLayoutConfig.h"
#import "TJSBaseTableViewCell.h"
#import "WithDrawDepositHeaderFooterView.h"


@interface WithDrawDepositCellFactory ()

@property (nonatomic,strong)WithDrawDepositCellLayoutConfig *layoutConfig;

@end

@implementation WithDrawDepositCellFactory

- (instancetype)init{
 
    self = [super init];

    if(self){
    
        _layoutConfig = [[WithDrawDepositCellLayoutConfig alloc]init];
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


- (WithDrawDepositHeaderFooterView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section{

    static NSString *const headerFooterIdentifier = @"WithDrawDepositHeaderFooterView";
    
    WithDrawDepositHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    
    if(!header){
        
        [tableView registerClass:[WithDrawDepositHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
        
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    }
    
    return header;

}



@end
