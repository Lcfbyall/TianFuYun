//
//  MyFavViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "MyFavListConfigurateProtocol.h"
#import "TJSProductListCellProtocol.h"

@interface MyFavViewController : TJSBaseViewController<MyFavListInteractorDelegate,TJSProductListCellDelegate>

@end
