//
//  MyOrderListViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSMyOrderListVCProtocol.h"
#import "TJSMyOrderListConfigurateProtocol.h"

@interface MyOrderListViewController : TJSBaseViewController<MyOrderVCConfig,TJSMyOrderListInteractorDelegate,TJSBaseTableViewCellDelegate>



@end
