//
//  MineHomeCellInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeCellInfoModel.h"
#import "UIApplication+TJSAppVersion.h"


//
static NSString *const Balance_cell  = @"MineHomeBalanceCell";
static NSString *const AllOrder_cell = @"MineHomeDefaultCell";
static NSString *const Order_cell    = @"MineHomeOrderCell";
static NSString *const Default_cell  = @"MineHomeDefaultCell";
static NSString *const Invest_cell = @"MineHomeInvestCell";

#define orderImgs @[@"appointment",@"alloc_wait",@"check_wait",@"comm_wait",@"comm_suc",@"comm_fail"]
#define investImgs  @[@"total_invest",@"money_record",@"bank_card_new",@"manager"]
#define fourthImages  @[@"my_reward",@"my_collection",@"apply_trading",@"use_protocol",@"feedback",@"about_us",@"version"]


@interface MineHomeCellInfoModel ()
{

    NSString *Balance_AccoutLeft;
    NSString *Balance_WithDraw;
    NSString *AllOrder_MyOrder;
    NSString *AllOrder_AllOrder;
    NSArray  *orderStatus;
    NSArray  *investTypes;
    NSArray  *fourthTitles;
}

@end

@implementation MineHomeCellInfoModel

- (instancetype)init{
  
    self = [super init];
    if(self){
    
        Balance_AccoutLeft = NSLocalizedString(@"account_balance:", @"账户余额:");
        Balance_WithDraw   = NSLocalizedString(@"withDrawDeposit", @"提现");
        AllOrder_MyOrder   = NSLocalizedString(@"my_order", @"我的订单");
        AllOrder_AllOrder  = NSLocalizedString(@"my_allOrders", @"全部订单");
        
        orderStatus  = @[
                         NSLocalizedString(@"order_status_InBooking",@"预约中"),
                         NSLocalizedString(@"order_status_InDeclarating",@"待报单"),
                         NSLocalizedString(@"order_status_InCheking",@"审核中"),
                         NSLocalizedString(@"order_status_InSettling",@"待结算"),
                         NSLocalizedString(@"order_status_Settled",@"已结算"),
                         NSLocalizedString(@"order_status_Failed",@"失败"),
                        ];
        
        investTypes  = @[
                         NSLocalizedString(@"total_Invest",@"累计投资   "),
                         NSLocalizedString(@"capital_Record",@"资金记录   "),
                         NSLocalizedString(@"bankCard_Manage",@"银行卡管理"),
                         NSLocalizedString(@"exclusive_Manager",@"专属经理   "),
                       ];
        
        fourthTitles = @[
                         NSLocalizedString(@"my_rewards",@"我的奖励"),
                         NSLocalizedString(@"my_colloeciton",@"我的收藏"),
                         NSLocalizedString(@"contract_apply",@"合同申请"),
                         NSLocalizedString(@"use_agreement",@"使用协议"),
                         NSLocalizedString(@"user_feedback",@"用户反馈"),
                         NSLocalizedString(@"about_us",@"关于我们"),
                         NSLocalizedString(@"current_version",@"当前版本"),
                     
                        ];
        
    }
    
    return self;
}


- (void)configItems{

    //第一组
    MineHomeCellInfo *balance = [MineHomeCellInfo new];
    balance.cellClass     = NSClassFromString(Balance_cell);
    balance.title         = [NSString stringWithFormat:@"%@   %@",Balance_AccoutLeft,@"0.0元"];
    balance.image         = nil;
    balance.detailTitle   = Balance_WithDraw;
    balance.cellItems     = nil;
    balance.accessoryType = UITableViewCellAccessoryNone;
    balance.selectionStyle= UITableViewCellSelectionStyleNone;
    balance.target        = nil;
    balance.targetParams  = nil;
    balance.cellOperation = NULL;
    balance.itemOperation = ^(id obj1, id obj2) {
        //去提现
        [UIViewController tjs_pushViewController:WithDrawDepositVC params:@{} animated:YES];
    };


    //第二组
    MineHomeCellInfo *allOrder = [MineHomeCellInfo new];
    allOrder.cellClass     = NSClassFromString(AllOrder_cell);
    allOrder.title         = AllOrder_MyOrder;
    allOrder.image         = nil;
    allOrder.detailTitle   = AllOrder_AllOrder;
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
    order.cellClass   = NSClassFromString(Order_cell);
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
    invest.cellClass  = NSClassFromString(Invest_cell);
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
                    [TJSAlertHandleUtil alertHandleCallManager];
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
    NSArray *fourthTargets= @[RewardListVC,
                              MyFavariteVC,
                              MyContractVC,
                              UseAgreementVC,
                              FeedbackContainerVC,
                              AboutMeVC,@""];
    
    [fourth enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MineHomeCellInfo *info = (MineHomeCellInfo *)obj;
        info.cellClass = NSClassFromString(Default_cell);
        info.title = [fourthTitles objectAtIndex:idx];
        info.image = [fourthImages objectAtIndex:idx];
        info.target= [fourthTargets objectAtIndex:idx];
        info.selectionStyle= UITableViewCellSelectionStyleDefault;
        WEAK_SELF(info);
        if(idx==fourthTitles.count-1){
            
            NSString *appverison = [UIApplication tjs_appverison];
            
            info.detailTitle = [NSString stringWithFormat:@"V%@",appverison];
            info.accessoryType = UITableViewCellAccessoryNone;
            info.cellOperation = NULL;
        }else{
            info.detailTitle = nil;
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
