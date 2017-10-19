//
//  TJSMineHomeDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeDataSourceImpl.h"
#import "MineHomeNetworkTool.h"
#import "MineHomeHeaderCollectionLayout.h"
#import "MineHomeCellInfoModel.h"

@interface TJSMineHomeDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *headerDatas;
@property (nonatomic, strong) MineHomeCellInfoModel *model;
@property (nonatomic,strong)  MineHomeHeaderCollectionLayout *layout;

@end


@implementation TJSMineHomeDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
        
        _headerDatas = [NSMutableArray array];
    }
    
    return self;
}


#pragma mark - <TJSMineHomeDataSource>

- (void)loadDatas:(void (^)(void))callback{
    
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
       NSArray *datas = @[@[NSLocalizedString(@"total_EarnedAmount", @"累计赚取金额(元)"),@"0.00"],@[NSLocalizedString(@"pending_commissionAmount", @"待结算佣金(元)"),@"10000"]];
       
       NSNumber *hide = @NO;
       
       _headerDatas = [NSMutableArray arrayWithObjects:datas,hide, nil];
       
       [self.layout calculateLayoutAttributes];
       
       _model = [MineHomeCellInfoModel new];
       
       [_model configItems];
       
       _items = _model.items;
       
       dispatch_async(dispatch_get_main_queue(), ^{
           
           if(callback)callback();
        
       });
   });
}

- (NSArray *)items{
    
    return _items;
}

- (NSArray *)headerDatas{
 
    return _headerDatas;
}

- (UICollectionViewLayout *)headerLayout{
  
    if(_layout == nil){
        
        _layout = [[MineHomeHeaderCollectionLayout alloc]init];
    }
    
    return _layout;
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
