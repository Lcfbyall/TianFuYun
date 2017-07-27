//
//  HomeViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "HomeVCConfig.h"
#import "TJSHomeListConfigurateProtocol.h"
#import "TJSProductListCellProtocol.h"

@interface HomeViewController : TJSBaseViewController<TJSHomeListInteractorDelegate,TJSProductListCellDelegate,HomeVCConfig>



@end
