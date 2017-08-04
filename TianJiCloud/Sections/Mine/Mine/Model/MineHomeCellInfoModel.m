//
//  MineHomeCellInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeCellInfoModel.h"


@implementation MineHomeCellInfoModel

- (void)configItems{
    
    MineHomeCellInfo *balance = [MineHomeCellInfo new];
    balance.cellClass     = NSClassFromString(@"MineHomeBalanceCell");
    balance.title         = @"账户余额";
    balance.image         = nil;
    balance.detailTitle   = @"提现";
    balance.cellItems     = nil;
    balance.accessoryType = UITableViewCellAccessoryNone;
    balance.target        = nil;
    balance.targetParams  = nil;
    balance.cellOperation = NULL;
    balance.itemOperation = ^(id obj1, id obj2) {
        
        //去提现
        
    };
    
    
    MineHomeCellInfo *allOrder = [MineHomeCellInfo new];
    allOrder.cellClass     = NSClassFromString(@"MineHomeDefaultCell");
    allOrder.title         = @"我的订单";
    allOrder.image         = nil;
    allOrder.detailTitle   = @"全部订单";
    allOrder.cellItems     = nil;
    allOrder.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    allOrder.target        = @"MyOrderContainerController";
    allOrder.targetParams  = nil;
    allOrder.cellOperation = ^(id obj1, id obj2) {
       
        //去订单容器
        
    };
    allOrder.itemOperation = NULL;
    
    
    
    MineHomeCellInfo *order   = [MineHomeCellInfo new];
    order.cellClass   = NSClassFromString(@"MineHomeOrderCell");
    order.title         = nil;
    order.image         = nil;
    order.detailTitle   = nil;
    order.accessoryType = UITableViewCellAccessoryNone;
    order.target        = nil;
    order.targetParams  = nil;
    order.cellOperation = NULL;
    order.itemOperation = NULL;
    order.cellItems     = ({
      
      NSArray *orderStatus = @[@"预约中",@"待报单",@"审核中",@"待结算",@"已结算",@"失败"];
      NSArray *orderImgs = @[@"预约中",@"待报单",@"审核中",@"待结算",@"已结算",@"失败"];
        
      NSArray *cellBtnItems =
      @[
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
      ];
        
      [cellBtnItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
          MineHomeCellItem *item = (MineHomeCellItem *)obj;
          item.title = [orderStatus objectAtIndex:idx];
          item.img   = [orderImgs objectAtIndex:idx];
          item.target= @"MyOrderContainerController";
          item.targetParams = @{@"selectedIndex":@(idx)};
          
          WEAK_SELF(item);
          item.itemOperation = ^(id obj1, id obj2) {
              
              STRONG_SELF(item);
              //去相应状态的订单
              [UIViewController tjs_pushViewController:item.target params:item.targetParams  animated:YES];
          };
      }];
        
        cellBtnItems;
    });
    
    
    
    MineHomeCellInfo *invest  = [MineHomeCellInfo new];
    invest.cellClass  = NSClassFromString(@"MineHomeInvestCell");
    invest.title         = nil;
    invest.image         = nil;
    invest.detailTitle   = nil;
    invest.accessoryType = UITableViewCellAccessoryNone;
    invest.target        = nil;
    invest.targetParams  = nil;
    invest.cellOperation = NULL;
    invest.itemOperation = NULL;
    invest.cellItems     = ({
    
        NSArray *investTypes = @[@"累计投资",@"资金记录",@"银行卡管理",@"专属经理"];
        NSArray *investImgs  = @[@"累计投资",@"资金记录",@"银行卡管理",@"专属经理"];
        NSArray *targets = @[@"CumulativeInvestController",
                             @"CapitalRecordContainer",
                             @"BackCardManagerController",@""];
        
        NSArray *cellBtnItems =
        @[
          [MineHomeCellItem new],
          [MineHomeCellItem new],
          [MineHomeCellItem new],
          [MineHomeCellItem new],
        
          ];
        
        [cellBtnItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            MineHomeCellItem *item = (MineHomeCellItem *)obj;
            item.title = [investTypes objectAtIndex:idx];
            item.img   = [investImgs objectAtIndex:idx];
            item.target= [targets objectAtIndex:idx];
            item.targetParams = @{};
            
            WEAK_SELF(item);
            item.itemOperation = ^(id obj1, id obj2) {
                
                STRONG_SELF(item);
                //跳转到相应控制器，专属经理直接弹框打电话
                if(idx==investTypes.count-1){
                
                   //Allert
                    
                    
                }else{
                
                    [UIViewController tjs_pushViewController:item.target params:item.targetParams animated:YES];
                }
                
            };
        }];
        
        cellBtnItems;
    });
    
    
    
    
    NSArray *first   = @[balance];
    NSArray *second  = @[allOrder,order];
    NSArray *third   = @[invest];
    NSArray *fourth  = @[
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                        ];
    
    
    [fourth enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        MineHomeCellInfo *model = (MineHomeCellInfo *)obj;
        model.cellClass = NSClassFromString(@"MineHomeDefaultCell");
        
        
        
    }];
    
   _items =  [NSMutableArray arrayWithObjects:first,second,third,fourth, nil];
}


@end
