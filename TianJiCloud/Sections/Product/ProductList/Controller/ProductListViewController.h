//
//  ProductViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSProductListConfigurateProtocol.h"
#import "TJSProductListCellProtocol.h"
#import "ProductListVCConfig.h"

@interface ProductListViewController : TJSBaseViewController<TJSProductListInteractorDelegate,TJSProductListCellDelegate,ProductListVCConfig>

@end
