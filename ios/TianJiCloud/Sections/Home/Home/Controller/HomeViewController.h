//
//  HomeViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSHomeListVCProtocol.h"
#import "TJSHomeListConfigurateProtocol.h"


@interface HomeViewController : TJSBaseViewController<TJSHomeListInteractorDelegate,TJSBaseTableViewCellDelegate,HomeVCConfig>



@end
