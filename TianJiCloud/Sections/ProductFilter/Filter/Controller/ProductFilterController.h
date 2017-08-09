//
//  ProductFilterController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "ProductFilterProtocol.h"
#import "TJSProductFilterConfigurateProtocol.h"
#import "TJSProductFilterCellProtocol.h"


@interface ProductFilterController : TJSBaseViewController<ProductFilterVCConfig,TJSProductFilterInteractorDelegate,TJSProductFilterCellDelegate>



@end
