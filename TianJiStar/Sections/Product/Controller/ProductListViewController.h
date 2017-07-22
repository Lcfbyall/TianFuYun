//
//  ProductViewController.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSProductListConfigurateProtocol.h"
#import "TJSProductListCellProtocol.h"

@interface ProductListViewController : TJSBaseViewController<TJSProductListCellDelegate,TJSProductListInteractorDelegate>

@property (nonatomic, strong,readonly) UITableView *tableView;

@end
