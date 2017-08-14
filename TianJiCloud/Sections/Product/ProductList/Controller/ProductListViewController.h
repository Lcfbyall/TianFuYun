//
//  ProductViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSProductListConfigurateProtocol.h"

@interface ProductListViewController : TJSBaseViewController<TJSProductListInteractorDelegate,TJSBaseTableViewCellDelegate>

@end
