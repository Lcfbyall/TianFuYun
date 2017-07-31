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
@property (nonatomic, strong) MineHomeCellInfoModel *model;

@end


@implementation TJSMineHomeDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
        
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


@end
