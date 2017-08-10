//
//  ProductSearchController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSProductSearchVCProtocol.h"
#import "ProductSerachConfigurateProtocol.h"
#import "ProductSearchHotCellProtocol.h"

@interface ProductSearchController : TJSBaseViewController<ProductSearchVCConfig,ProductSearchHotCellDelegate,ProductSerachInteractorDelegate>

@end
