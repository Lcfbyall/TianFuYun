//
//  TJSMineHomeDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeDataSourceImpl.h"

#import "MineHomeCellInfoModel.h"

@interface TJSMineHomeDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *headerDatas;
@property (nonatomic, strong) MineHomeCellInfoModel *model;

@end


@implementation TJSMineHomeDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
        
        _headerDatas = [NSMutableArray array];
        
        _model = [MineHomeCellInfoModel new];
        
        [_model configItems];
        
        _items = _model.items;
    }
    
    return self;
}


#pragma mark - <TJSMineHomeDataSource>

- (NSArray *)items{
    
    return _items;
}

- (NSArray *)headerDatas{
 
    if(!_headerDatas.count){
        
        NSArray *datas = @[@[NSLocalizedString(@"total_EarnedAmount", @"累计赚取金额(元)"),@"0.00"],@[NSLocalizedString(@"pending_commissionAmount", @"待结算佣金(元)"),@"10000"]];
        
        NSNumber *hide = @NO;
        
        _headerDatas = [NSMutableArray arrayWithObjects:datas,hide, nil];
    }
    
    return _headerDatas;
}

- (void)hideOrShowMoney:(BOOL)hide callback:(void (^)(void))callback{

    BOOL hideN = ![[_headerDatas lastObject] boolValue];
    NSArray *datas = [_headerDatas firstObject];
    _headerDatas = [NSMutableArray arrayWithObjects:datas,@(hideN), nil];
    
    MineHomeCellInfo *balance = [_model balance];
    balance.hideTitle = hide;
    [_model configBalance];
    
    if(callback)callback();
}

@end
