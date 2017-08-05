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


    //第一组
    MineHomeCellInfo *balance = [MineHomeCellInfo new];
    balance.cellClass     = NSClassFromString(@"MineHomeBalanceCell");
    balance.title         = @"账户余额";
    balance.image         = nil;
    balance.detailTitle   = @"提现";
    balance.cellItems     = nil;
    balance.accessoryType = UITableViewCellAccessoryNone;
    balance.selectionStyle= UITableViewCellSelectionStyleNone;
    balance.target        = nil;
    balance.targetParams  = nil;
    balance.cellOperation = NULL;
    balance.itemOperation = ^(id obj1, id obj2) {
        //去提现
        [UIViewController tjs_pushViewController:WithdrawDepositVC params:@{} animated:YES];
    };


    //第二组
    MineHomeCellInfo *allOrder = [MineHomeCellInfo new];
    allOrder.cellClass     = NSClassFromString(@"MineHomeDefaultCell");
    allOrder.title         = @"我的订单";
    allOrder.image         = nil;
    allOrder.detailTitle   = @"全部订单";
    allOrder.cellItems     = nil;
    allOrder.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    allOrder.selectionStyle= UITableViewCellSelectionStyleDefault;
    allOrder.target        = MyOrderContainerVC;
    allOrder.targetParams  = nil;
    WEAK_SELF(allOrder);
    allOrder.cellOperation = ^(id obj1, id obj2) {
        STRONG_SELF(allOrder);
        //去订单容器
        [UIViewController tjs_pushViewController:allOrder.target params:@{} animated:YES];
    };
    allOrder.itemOperation = NULL;
    MineHomeCellInfo *order   = [MineHomeCellInfo new];
    order.cellClass   = NSClassFromString(@"MineHomeOrderCell");
    order.title         = nil;
    order.image         = nil;
    order.detailTitle   = nil;
    order.accessoryType = UITableViewCellAccessoryNone;
    order.selectionStyle= UITableViewCellSelectionStyleNone;
    order.target        = nil;
    order.targetParams  = nil;
    order.cellOperation = NULL;
    order.itemOperation = NULL;
    order.cellItems     = ({
      NSArray *orderStatus = @[@"预约中",@"待报单",@"审核中",@"待结算",@"已结算",@"失败"];
      NSArray *orderImgs = @[@"appointment",@"alloc_wait",@"check_wait",@"comm_wait",@"comm_suc",@"comm_fail"];
      NSArray *cellBtnItems =
      @[[MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],
         [MineHomeCellItem new],];
      [cellBtnItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
          MineHomeCellItem *item = (MineHomeCellItem *)obj;
          item.title = [orderStatus objectAtIndex:idx];
          item.img   = [orderImgs objectAtIndex:idx];
          item.target= MyOrderContainerVC;
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


    //第三组
    MineHomeCellInfo *invest  = [MineHomeCellInfo new];
    invest.cellClass  = NSClassFromString(@"MineHomeInvestCell");
    invest.title         = nil;
    invest.image         = nil;
    invest.detailTitle   = nil;
    invest.accessoryType = UITableViewCellAccessoryNone;
    invest.selectionStyle= UITableViewCellSelectionStyleNone;
    invest.target        = nil;
    invest.targetParams  = nil;
    invest.cellOperation = NULL;
    invest.itemOperation = NULL;
    invest.cellItems     = ({
        NSArray *investTypes = @[@"累计投资",@"资金记录",@"银行卡管理",@"专属经理"];
        NSArray *investImgs  = @[@"total_invest",@"money_record",@"bank_card_new",@"manager"];
        NSArray *targets = @[CumulativeInvestVC,
                             CapitalRecordContainerVC,
                             BankCardManagerVC,
                             @""];
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
    //第四组
    NSArray *fourth  = @[[MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],];
    NSArray *fourthTitles = @[@"我的奖励",
                              @"我的收藏",
                              @"合同申请",
                              @"使用协议",
                              @"用户反馈",
                              @"关于我们",
                              @"当前版本"];
    NSArray *fourthImages = @[@"my_reward",
                              @"my_collection",
                              @"apply_trading",
                              @"use_protocol",
                              @"feedback",
                              @"about_us",
                              @"version"];
    NSArray *fourthTargets= @[RewardListVC,
                              MyFavariteVC,
                              ContractApplyVC,
                              UseAgreementVC,
                              FeedbackContainerVC,
                              AboutMeVC,@""];
    
    [fourth enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MineHomeCellInfo *info = (MineHomeCellInfo *)obj;
        info.cellClass = NSClassFromString(@"MineHomeDefaultCell");
        info.title = [fourthTitles objectAtIndex:idx];
        info.image = [fourthImages objectAtIndex:idx];
        info.target= [fourthTargets objectAtIndex:idx];
        info.selectionStyle= UITableViewCellSelectionStyleDefault;
        WEAK_SELF(info);
        if(idx==fourthTitles.count-1){
            info.detailTitle = @"V1.0.0";
            info.accessoryType = UITableViewCellAccessoryNone;
            info.cellOperation = NULL;
        }else{
            info.detailTitle = @"";
            info.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            info.cellOperation = ^(id obj1, id obj2) {
                STRONG_SELF(info);
                [UIViewController tjs_pushViewController:info.target animated:YES];
            };
        }
    }];
   _items =  [NSMutableArray arrayWithObjects:first,second,third,fourth, nil];
}


@end
